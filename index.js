const express=require('express');
const fs=require('fs');
const path=require('path');
const sharp=require('sharp');
const {Client}=require('pg');

const app=express();   ///server

const client=new Client({
    host: 'localhost',
    user: 'Andreea_Dobre',
    password: 'admin',
    database: 'E-books',
    port: 5432
});

client.connect();

app.set("view engine", "ejs");
app.use("/resurse", express.static(__dirname+"/resurse"));

function verificaImagini()
{
    var textFisier=fs.readFileSync("resurse/json/galerie.json");
    var jsi=JSON.parse(textFisier);
    var caleGalerie=jsi.cale_galerie;
    let vectorCai=[];
    for(let im of jsi.imagini)
    {
        var imVeche = path.join(caleGalerie, im.fisier);
        var ext=path.extname(im.fisier);
        var numeFisier=path.basename(im.fisier, ext);
        let imNoua=path.join(caleGalerie+"/mic/", numeFisier+"-mic"+".webp");
        console.log(imNoua);

        var timp = new Date();


        if(timp.getMinutes()<=15 && im.sfert_ora=="1" && vectorCai.length<10)
            vectorCai.push({mare:"/"+imVeche,mic:"/"+imNoua,descriere:im.descriere});
        else if(timp.getMinutes()>15 && timp.getMinutes()<=30 && im.sfert_ora=="2" && vectorCai.length<10)
            vectorCai.push({mare:"/"+imVeche,mic:"/"+imNoua,descriere:im.descriere});
        else if(timp.getMinutes()>30 && timp.getMinutes()<=45 && im.sfert_ora=="3" && vectorCai.length<10)
            vectorCai.push({mare:"/"+imVeche,mic:"/"+imNoua,descriere:im.descriere});
        else if(timp.getMinutes()>45 && im.sfert_ora=="4" && vectorCai.length<10)
            vectorCai.push({mare:"/"+imVeche,mic:"/"+imNoua,descriere:im.descriere});

        if(!fs.existsSync(imNoua))
            sharp(imVeche)
                .resize(150)
                .toFile(imNoua, function(err){
                    if(err)
                        console.log("eroare conversie", imVeche, "->", imNoua);
                });
    }
    return vectorCai;
}

function GalerieAnimata()
{
    var textFisier=fs.readFileSync("resurse/json/galerie.json");
    var jsi=JSON.parse(textFisier);
    var caleGalerie=jsi.cale_galerie;
    let vectorCai=[];
    /*let vectornumere=[4, 9, 16];
    const pozitie=Math.floor(Math.random()*vectornumere.length);*/

    for(let im of jsi.imagini)
    {
        var imVeche = path.join(caleGalerie, im.fisier);
        var ext=path.extname(im.fisier);
        var numeFisier=path.basename(im.fisier, ext);
        let imNoua=path.join(caleGalerie+"/mic/", numeFisier+"-mic"+".webp");

        if(vectorCai.length<9 && im.titlu.length<=12)
            vectorCai.push({mare:"/"+imVeche,mic:"/"+imNoua,descriere:im.descriere});

        if(!fs.existsSync(imNoua))
        sharp(imVeche)
            .resize(150)
            .toFile(imNoua, function(err){
                if(err)
                    console.log("eroare conversie", imVeche, "->", imNoua);
            });
    }

    return vectorCai;
}

app.get(["/", "/index"], function(req, res){
    var userip = req.ip;
    let vectorCai=verificaImagini();
    res.render("pagini/index",{"userip":userip, imagini:vectorCai});
});

app.get("/books", function(req, res){
    
    const rezultat=client.query("select id, titlu, descriere, pret, gen, imagine from ebooks", function(err, rez){
        console.log(err, rez);
        res.render("pagini/books", {books:rez.rows});
    });  
});

app.get("/singlebook/:id", function(req, res){

    const rezultat = client.query("select * from ebooks where id ="+req.params.id, function(err, rez){
        res.render("pagini/singlebook", {carte:rez.rows[0]});
    
    });  
});

app.get("/galerie", function(req, res){
    res.render("pagini/galerie",{imaginiA:GalerieAnimata(), imagini:verificaImagini()});
});

app.get(["/resurse", "/resurse/json", "/resurse/json/galerie"], function(req, res){
    res.render("pagini/error-403",{imaginiA:GalerieAnimata()});
});

app.get("/*", function(req, res){
    res.render("pagini"+req.url, function(err, rezultatRender){
        if(err)
        {
            if(err.message.includes("Failed to lookup view"))
            {
                res.status(404).render("pagini/error");
            }
            else
                throw err;
        }
        else
            {
                res.send(rezultatRender);
                
            }

    });
});

app.listen(8080);
console.log("A pornit");



