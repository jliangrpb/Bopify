const SET_CURRENT_SONG = 'SET_CURRENT_SONG';
const SET_CURRENT_ALBUM = 'SET_CURRENT_ALBUM';


export const setCurrentSong = (song) => ({
    type: SET_CURRENT_SONG,
    song
})

export const setCurrentAlbum = (album) => ({
    type: SET_CURRENT_ALBUM,
    album
})


const audioReducer = (state = {}, action ) => {
    const nextState = {...state}

    switch (action.type) {
        case SET_CURRENT_SONG:
            nextState["currentSong"] = action.song;
            return nextState;
        case SET_CURRENT_ALBUM:
            nextState["currentAlbum"] = action.album
            return nextState;
        default:
            return nextState;
        
    };
};

export default audioReducer;