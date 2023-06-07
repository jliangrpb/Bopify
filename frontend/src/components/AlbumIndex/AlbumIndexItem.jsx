import { NavLink } from 'react-router-dom';
import React from 'react';

function AlbumIndexItem({album}) {
    const { id, name } = album;

    const artistName = album.artist;

    return (
        <NavLink to={`albums/${id}`} className='album-index-item-link'>
            <div className='album-index-item'>
                <h3 className="album-name">{name}</h3>
                <p className="album-index-artist-name">{artistName}</p>
            </div>
        </NavLink>
    )
}

export default AlbumIndexItem;