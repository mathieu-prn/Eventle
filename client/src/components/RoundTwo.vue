<template>
  <div v-if="!lockedGuess" id="round2">
    <h2>Where did the following event happen:</h2>
    <h2>
      <span class="highlight">{{ eventClue }} </span> ?
    </h2>
    <div style="width: 50vw; height: 30vh">
      <l-map
        ref="map"
        v-model:zoom="zoom"
        :center="[41, 12]"
        @click="selectCoord"
      >
        <l-tile-layer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          layer-type="base"
          name="OpenStreetMap"
          attribution="&copy; <a href='https://www.openstreetmap.org/copyright'>OpenStreetMap</a>"
        ></l-tile-layer>
        <l-marker v-if="showMarker" :lat-lng="guessCoord"></l-marker>
      </l-map>
    </div>
    <p>You selected {{ guessCoord }}</p>
    <p>Country: {{ guessCountry }}</p>
  </div>
  <div v-else id="round2-guessed">
    <h2>Good job !</h2>
  </div>
</template>

<script>
import "leaflet/dist/leaflet.css";
import { LMap, LTileLayer, LMarker } from "@vue-leaflet/vue-leaflet";
import axios from "axios";

export default {
  components: {
    LMap,
    LTileLayer,
    LMarker,
  },
  data() {
    return {
      zoom: 3,
      guessCoord: [0, 0],
      guessCountry: "None",
      showMarker: false,
    };
  },
  props: {
    eventClue: {
      type: String,
      required: true,
    },
    lockedGuess: {
      type: Boolean,
      required: true,
    },
  },
  methods: {
    async selectCoord(event) {
      console.log(event);
      this.showMarker = true;
      this.guessCoord = [event.latlng.lat, event.latlng.lng];

      try {
        const response = await axios.get(
          `http://api.geonames.org/countryCodeJSON?formatted=true&username=eventle&lat=${this.guessCoord[0]}&lng=${this.guessCoord[1]}`
        );
        if (response.data) {
          this.guessCountry = response.data.countryName;
        }
      } catch (error) {
        console.error("Error:", error);
        alert(
          error.response.data.message ||
            "An error occurred. Please try again later."
        );
      }
    },
  },
};
</script>
