module.exports = function(_status, _message, _data){
    return {
        status: _status || false,
        message: _message || '',
        data: _data || null
    }
}