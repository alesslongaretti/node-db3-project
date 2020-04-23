const db = require('../data/db-config.js');

function find() {
   return db('schemes')
}

function findById(id) {
    return db('schemes')
        .where({id})
        .first();
}

function findSteps(id) {
    return db('steps')
        .join('schemes', 'schemes.id','steps.scheme_id')
        .select('steps.id','scheme_name', 'step_number','instructions')
        .where({ scheme_id: id})   
}

function add(schemeData) {
    return db('schemes').insert(schemeData);
}

function addStep(stepData, scheme_id) {
    return db('steps')
    .insert(stepData, scheme_id)
    .then(ids => ({ scheme_id: ids[0] }));
}

function update(changes,id) {
    return db('schemes')
    .where({ id })
    .update(changes)
}

function remove(id) {
    return db('schemes')
        .where({ id })
        .del();
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
};