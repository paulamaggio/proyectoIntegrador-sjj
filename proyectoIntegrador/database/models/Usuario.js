module.exports = function (sequelize, dataTypes) {
    let alias = 'Usuario';
    let cols = {
        id:{
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        nombreUsuario:{
            type: dataTypes.STRING
        },
        email:{
            type: dataTypes.STRING
        },
        contrasena:{
            type: dataTypes.STRING
        },
        fotoPerfil:{
            type: dataTypes.STRING
        },
        fecha:{
            type: dataTypes.DATE
        },
        dni:{
            type: dataTypes.INTEGER
        },
    }
    let config = {
        tableName: 'usuarios',
        timestamps: true,
        underscored: false,
    }
    
    const Usuario = sequelize.define(alias, cols, config);
    
    Usuario.associate = function(models){
        Usuario.hasMany(models.Producto,{
            as: 'productos',
            foreignKey: 'idUsuario'
        })
        Usuario.hasMany(models.Comentario, {
            as: 'comentarios',
            foreignKey: 'idUsuario'
        })
    }
    return Usuario;
}
