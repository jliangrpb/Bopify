import { NavLink } from 'react-router-dom';
import React from 'react';

function AlbumIndexItem({album}) {
    const { id, name, photo } = album;

    const artistName = album.artist;
    return (
        <NavLink to={`albums/${id}`} className='album-index-item-link'>
            <div className='album-index-item'>
                <div className='album-image'>
                <img src={photo} alt=''></img>
                </div>
                <h3 className="album-index-name">{name}</h3>
                <p className="album-index-artist-name">{artistName}</p>
            </div>
        </NavLink>
    )
};

export default AlbumIndexItem;