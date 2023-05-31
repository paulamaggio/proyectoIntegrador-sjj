module.exports = function (sequelize, dataTypes) {
    let alias = 'Producto';
    let cols = {
        id:{
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        idUsuario:{
            type: dataTypes.INTEGER
        },
        nombreProducto:{
            type: dataTypes.STRING,
        },
        fotoProducto:{
            type: dataTypes.STRING,
        },
        descripcion:{
            type: dataTypes.STRING,
        },

    }
    let config = {
        tableName: 'productos',
        timestamps: true,
        underscored: false,
    }

    const Producto = sequelize.define(alias, cols, config);
    
    Producto.associate = function(models){
        Producto.belongsTo(models.Usuario, {
            as: 'productoUsuario',
            foreignKey: 'idUsuario',
        });
        Producto.hasMany(models.Comentario,{
            as: 'comentario',
            foreignKey: 'idPost'
        })
    }
    return Producto;
}