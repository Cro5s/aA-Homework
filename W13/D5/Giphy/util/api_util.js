export const fetchSearchGiphys = searchTerm => {
  return $.ajax({
    method: "GET",
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=YrElAc7ZITzcH2unubBEOY47jE1xOVJt&limit=2`
  });
};