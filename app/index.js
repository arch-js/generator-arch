var yeoman = require('yeoman-generator');
var chalk = require('chalk');
var yosay = require('yosay');

module.exports = yeoman.generators.Base.extend({
  initializing: function () {
    this.pkg = require('../package.json');
  },

  writing: {
    app: function(){
      this.fs.copy(
        this.templatePath('_package.json'),
        this.destinationPath('package.json')
      );

      this.fs.copy(
        this.templatePath('_.gitignore'),
        this.destinationPath('.gitignore')
      );

      this.fs.copy(
        this.templatePath('app/**/*'),
        this.destinationPath('app')
      );
    }
  },

  runNpm: function(){
    this.npmInstall();
  },

  end: function(){
    console.log('Your Reflex app has been generated! Use \'reflex s\' to run it.');
  },
});