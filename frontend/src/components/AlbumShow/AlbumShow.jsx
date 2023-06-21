import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchAlbum } from '../../store/album';
import SideBar from '../SideBar/SidesBar';
import Navigation from '../Navigation';
import Song from '../Song/Song';
import './AlbumShow.css';

function AlbumShow() {
  const { albumId } = useParams();
  const dispatch = useDispatch();
  const album = useSelector((state) => state.album[albumId]);
  const songs = useSelector((state) => (state.album[albumId]?.songs) ? Object.values(state.album[albumId]?.songs) : null);



  useEffect(() => {
    dispatch(fetchAlbum(albumId));
  }, [dispatch, albumId]);

  if (!album) {
    return null;
  }

  let songCount = album?.songs ? Object.values(album.songs).length : 0;


  return (
  <div className='album-show-page'>
    <SideBar />
    <div className='album-show-nav'>
      <Navigation />
      <div className='album-show-container'>
        <div className='album-details'>
            <div className="album-photo2">
            <img  src={album?.photo} alt='' />
            </div>
            <div className='album-text'>
                <p className='album-show-name'>{album.name}</p>
                <div className='artist-and-song-count'>
                    <i className="artist-picture fa-solid fa-user fa-xs" style={{ color: '#ffffff' }} ></i>
                    <p className='artist-name'>{album.artist}</p>
                    <p className='bullet-point'>•</p>
                    <p className='song-count'>{songCount} Songs</p>
                </div>
            </div>
        </div>
        <div className='album-songs'>
            <div className='hashtag-and-title'>
            <p className='hashtag'>#</p>
            <p className='title-text'>TITLE</p>
            </div>
            <div className='album-songs-list-container'>
            {songs?.map((song, index) => (
                <Song
                key={song.id}
                song={song}
                albumId={index + 1}
                />
            ))}
            </div>
        </div>
      </div>
    </div>
  </div>
);

};

export default AlbumShow;
