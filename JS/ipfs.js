import fs from 'fs';
import * as IPFS from 'ipfs-core';
const imgToIpfs = document.getElementById('itsrc');
const imgToIpfsbtn = document.getElementById('replaceAdd');
const testFile = fs.readFileSync(imgToIpfs.value);
const testBuffer = Buffer.from(testFile);

async function go() {
    const ipfs = await IPFS.create();
    const {cid} = await ipfs.add(testBuffer);
    imgToIpfs.value = cid;
}
imgToIpfsbtn.addEventListener("click",go);