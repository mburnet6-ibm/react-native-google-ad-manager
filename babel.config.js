module.exports = {
  env: {
    test: {
      presets: ['@babel/preset-env', '@babel/preset-react'],
      plugins: [
        'transform-export-extensions',
        '@babel/plugin-proposal-class-properties',
      ],
      only: ['./**/*.js', 'node_modules/jest-runtime'],
    },
  },
}
