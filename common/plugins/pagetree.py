from pelican import signals

def treeify(gen):
    pages = {}
    for p in gen.pages:
        pages[p.slug] = p
        p.children = []
    for p in gen.pages:
        parent = p.slug.rpartition('/')[0]
        if parent in pages:
            p.parent = pages[parent]
            pages[parent].children.append(p)
        root = p.slug.partition('/')[0]
        if root in pages:
            p.root = pages[root]

def register():
    signals.page_generator_finalized.connect(treeify)
