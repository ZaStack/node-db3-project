const db = require('../data/db-config');

const find = () => {
    return db('schemes');
};

const findById = id => {
    return db('schemes')
        .where({ id })
        .first();
};

const findSteps = id => {
    return db('steps')
        .select(
            'schemes.scheme_name',
            'steps.step_number',
            'steps.instructions'
        )
        .join('schemes', 'schemes.id', '=', 'steps.scheme_id')
        .where({ scheme_id: id });
};

const add = schemes => {
    return db('schemes')
        .insert(schemes)
        .where();
};

const update = (changes, id) => {
    return db('schemes')
        .where({ id })
        .update(changes)
        .then(() => {
            return findById(id);
        });
};

const remove = id => {
    return db('schemes')
        .where({ id })
        .delete();
};

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};
