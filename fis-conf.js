fis.config.set('project.exclude', /\/node_modules\//i);
fis.config.set('roadmap.path', [
    {
        reg: /\/(LICENSE|README\.md|\.(sh|bat|cmd))$/i,
        release: false
    },
    {
        reg: 'map.json',
        release: false
    }
]);