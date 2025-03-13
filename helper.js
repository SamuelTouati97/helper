const express = require ('express');

const helper = express();
const port = 4000;

//routes 
helper.get('/', (req, res) => {
    console.log("enpoint", {route: '/'});
    res.send('Yo');
});

helper.use((err, req, res, next) => {
  console.error("Internal server error", { error: err.message });
  res.status(500).send("Internal Server Error");
});

helper.listen(port, ()=>{
    console.log(`app helper listenint at http://localhost:${port}`)
});