<template>
	<h1>Browse Past Events</h1>
	<p v-if="authStatus === 'anonymous'">Please log in to view past events.</p>
	<div v-if="authStatus === 'authenticated'" id="archive-container">
		<div v-for="date in dates" :key="date" class="archive-event">
			<button v-if="completedEvents.includes(date)" class="completed_event"><strong>Date:</strong> {{ date }}</button>
            <button v-else class="incomplete_event"><strong>Date:</strong> {{ date }}</button>
		</div>
	</div>
</template>

<script>
import axios from "axios";
export default {
	data() {
		return {
			authStatus: "anonymous",
			dates: [],
            completedEvents: []
		};
	},
	async created() {
		const token = localStorage.getItem("accessToken");

		if (!token) {
			this.authStatus = "anonymous";
			return;
		}

		try {
			const response = await axios.get("http://localhost:3000/auth", {
				headers: { Authorization: `Bearer ${token}` }
			});
			this.user = response.data.user;
			this.authStatus = "authenticated";
			localStorage.setItem("user", JSON.stringify(this.user));
		} catch (error) {
			if (error.response && error.response.status === 401) {
				localStorage.removeItem("accessToken");
				localStorage.removeItem("user");
				this.authStatus = "anonymous";
			} else {
				console.error("Could not verify session:", error);
				this.authStatus = "anonymous";
			}
		}

        const now = new Date();
        let current = new Date("2026-10-29" + "T00:00:00Z");

        while (current <= now) {
            this.dates.push(current.toISOString().slice(0, 10));
            current.setDate(current.getDate() + 1);
        }

        try {
			const response = await axios.get("http://localhost:3000/archive", {
				headers: { Authorization: `Bearer ${token}` }
			});
			this.completedEvents = response.data.map(item => item.game_date);
            console.log("Completed events fetched:", this.completedEvents);
		} catch (error) {
			console.error("Error fetching completed events:", error);
		}
	},
};
</script>

<style scoped>
.completed_event {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.incomplete_event {
	background-color: #f44336;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
