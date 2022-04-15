export const fetchSearchGiphys = searchTerm => (
  $.ajax({
    method: 'GET',
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=r8BM6tI3QUZZoxrI76KANoRCTp20Qyda&limit=2`
  })
)