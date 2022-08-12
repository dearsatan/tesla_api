// /ebus/jxjxcxzcfu/hsjc/jkb/hsjcV1/reqNucleicAcidsDays
const path = "reqNucleicAcidsDays";

const url = $request.url;
const body = $response.body;

console.log("请求路径 : " + url)
console.log("修改前 : " + body)

if (url.indexOf(path) != -1) {
    let obj = JSON.parse(body);
    obj.data.afterTestTime = "1"
    
    let data = JSON.stringify(obj);
    console.log("修改后  : " + data)
    $done({body: data});
} else {
    console.log("未更改");
    $done({});
}
