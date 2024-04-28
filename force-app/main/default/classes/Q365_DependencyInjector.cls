/* optional todo: replace or extend the example dependency injector with your own existing dependency injector implementation */
public virtual with sharing class Q365_DependencyInjector
{
    private static Q365_DependencyInjector sInstance;

    @TestVisible
    private static void setInstance(Q365_DependencyInjector instance) {
        sInstance = instance;
    }

    public static Q365_DependencyInjector getInstance() {
        if (sInstance == null) {
            setInstance(new Q365_DependencyInjector(Q365_DependencyInjectorConfig.getTypeResolveMap()));
        }
        system.debug('Trying to fetch'+sInstance);
        return sInstance;
    }

    private final Map<Type, Type> typeResolveMap;
    private final Map<Type, Object> dependencyMap;

    @TestVisible
    protected Q365_DependencyInjector(Map<Type, Type> typeResolveMap) {
        this.typeResolveMap = typeResolveMap;
        this.dependencyMap = new Map<Type, Object>();
    }

    @TestVisible
    private Map<Type, Type> getTypeResolveMap() {
        return typeResolveMap;
    }

    @TestVisible
    private Map<Type, Object> getDependencyMap() {
        return dependencyMap;
    }

    public virtual Object get(Type type) {
        Type resolvedType;
        Object dependency = getDependencyMap().get(type);
        if (dependency == null) {
            resolvedType = resolveType(type);
            dependency = getDependencyMap().get(resolvedType);
            if (dependency == null) {
                dependency = resolvedType.newInstance();
                getDependencyMap().put(type, dependency);
                getDependencyMap().put(resolvedType, dependency);
            }
        }
        return dependency;
    }

    protected virtual Type resolveType(Type type) {
        final Type resolvedType = getTypeResolveMap().get(type);
        if (resolvedType == null) {
            return type;
        } else {
            return resolvedType;
        }
    }
}