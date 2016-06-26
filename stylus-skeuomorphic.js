exports = module.exports = function() {
  return function(stylus) {
    stylus
      .use(require('nib')())
      .include(__dirname);
  };
};
