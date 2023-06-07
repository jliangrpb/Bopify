import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchAlbum } from '../../store/album';
import Navigation from '../Navigation';
import SideBar from '../SideBar';
import './AlbumShow.css';

function AlbumShow() {
  const { albumId } = useParams();
  const dispatch = useDispatch();
  const album = useSelector((state) => state.album[albumId]);
  const songs = useSelector((state) => state.album[albumId]?.songs);


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
            {/* <img className="album-photo" src={album.photoUrl} alt='Album' /> */}
            <div className='album-text'>
            <p className='album-show-name'>{album.name}</p>
            <div className='artist-and-song-count'>
                <p className='artist-name'>{album.artist.name}</p>
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
            {/* {songs.map((song, idx) => (
            //   <Song
            //     key={idx}
            //     id={idx}
            //     songTitle={song.name}
            //     artistName={song.album.artist.name}
            //     albumId={song.album.id}
            //   />
            ))} */}
        </div>
      </div>
    </div>
  </div>
);

}

export default AlbumShow;
