var stylus         = require('stylus');
var nib            = require('nib');
var folderContents = require('folder-contents');
var fs             = require('fs');

var examplesFolders = folderContents({
    path: __dirname,
    filter: {
        folderIgnore: ['_import_theme']
    }
})['.folders'];

examplesFolders.forEach(function(folderName) {
    var dir = __dirname + '/' + folderName;

    new Promise(function(resolve, reject) {
        fs.readFile(dir + '/main.styl', 'utf8', function(err, str) {
            if (err) { reject(err); }
            resolve(str);
        });
    }).then(function(str) {
        return compile(str, dir + '/main.styl')
    }).then(function(css) {
        fs.writeFile(dir + '/main.css', css, function(err) {
            if (err) { Promise.reject(err); }
        });
    }).catch(function(err) { console.error(err); });
});


function compile(str, path) {
    return new Promise(function(resolve, reject) {
        stylus(str)
            .set('filename', path)
            .use(nib())
            .render(function(err, css) {
                if (err) { reject(err) }
                resolve(css);
            });
    });
}
