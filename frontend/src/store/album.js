import csrfFetch from "./csrf";

const GET_ALBUM = 'GET_ALBUM'
const GET_ALBUMS = 'GET_ALBUMS'

const getAlbum = (payload) => ({
    type: GET_ALBUM,
    payload
})

const getAlbums = (albums) => ({
    type: GET_ALBUMS,
    albums
})

export const fetchAlbum = (albumId) => async (dispatch) => {
    const res = await csrfFetch(`/api/albums/${albumId}`);
    const album = await res.json();
    return dispatch(getAlbum(album));
}

export const fetchAllAlbums = () => async (dispatch) => { 
    const res = await csrfFetch('/api/albums');
    const albums = await res.json();
    console.log(albums);
    return dispatch(getAlbums(albums));
}


const albumReducer = (state = {}, action) => {
    const nextState = { ...state }

    switch (action.type) {
        case GET_ALBUM:
            nextState[action.payload.album.id] = action.payload.album;
            return nextState;
        case GET_ALBUMS:
            for (let albumId in action.albums) {
            nextState[albumId] = action.albums[albumId];
            }
            return nextState;
        default:
            return nextState;
    };
};

export default albumReducer;