module.exports = function (sequelize, dataTypes) {
    let alias = 'Comentario';
    let cols = {
        id:{
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        idPost:{
            type: dataTypes.INTEGER
        },
        idUsuario:{
            type: dataTypes.INTEGER
        },
        comentario:{
            type: dataTypes.STRING
        },
    }
    let config = {
        tableName: 'comentarios',
        timestamps: true,
        underscored: false,
    }
    
    const Comentario = sequelize.define(alias, cols, config);
    
    Comentario.associate = function(models){
        Comentario.belongsTo(models.Producto,{
            as: 'productos',
            foreignKey: 'idPost'
        })
        Comentario.belongsTo(models.Usuario, {
            as: 'usuarios',
            foreignKey: 'idUsuario',
        });
    }
    return Comentario;
}