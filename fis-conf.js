fis.config.set('project.exclude', /\/node_modules\//i);
fis.config.set('roadmap.path', [
    {
        reg: /\/(LICENSE|README\.md|build\.(sh|bat|cmd))$/i,
        release: false
    }
]);