<template>
    <div id="admin-dashboard-container">
        <h1>Admin Dashboard</h1>
        <div id="users-list-cont">
            <div class="column-headers" aria-hidden="true">
                <span>Username</span>
                <span>Email</span>
                <span>Role</span>
                <span>Action</span>
            </div>
            <div v-for="user in users" :key="user.id" class="user-card">
                <p><span class="field-label">Username</span>{{ user.username }}</p>
                <p><span class="field-label">Email</span>{{ user.email }}</p>
                <p><span class="field-label">Role</span>{{ user.isadmin ? "Admin" : "User" }}</p>
                <button @click="confirmDeleteUser(user.id)">Delete</button>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";
export default {
    data() {
        return {
            users: [],
        }
    },
    mounted() {
        this.fetchUsers();
    },
    methods: {
        getToken() {
            const token = localStorage.getItem("accessToken");

            if (!token) {
                this.authStatus = "anonymous";
                return;
            }
            return token;
		},
        async fetchUsers() {
            try {
                const response = await axios.get("http://localhost:3000/users", {
                    headers: {
                        Authorization: `Bearer ${this.getToken()}`,
                    },
                });
                this.users = response.data;
            } catch (error) {
                console.error("Error fetching users:", error);
            }
        },
        confirmDeleteUser(userId) {
            if (confirm("Are you sure you want to delete this user?")) {
                this.deleteUser(userId);
            }
        },
        async deleteUser(userId) {
            try {
                await axios.delete("http://localhost:3000/deleteuser", {
                    headers: {
                        Authorization: `Bearer ${this.getToken()}`,
                    },
                    data: {
                        userId: userId
                    }
                });
                this.fetchUsers();
            } catch (error) {
                console.error("Error deleting user:", error);
            }
        }
    }
}


</script>

<style scoped>
#admin-dashboard-container {
    width: min(680px, 100%);
    margin: 0 auto;
    text-align: center;
}

#admin-dashboard-container h1 {
    margin: 0 0 12px;
}

#users-list-cont {
    display: flex;
    flex-direction: column;
    align-items: stretch;
    width: min(620px, 100%);
    margin: 0 auto;
    gap: 6px;
}

.column-headers {
    display: grid;
    grid-template-columns: 140px minmax(220px, 1fr) 70px 82px;
    align-items: center;
    min-height: 28px;
    padding: 0 8px 4px 12px;
    color: #1f3579;
    font-size: 0.78rem;
    font-weight: 800;
    text-align: left;
    text-transform: uppercase;
}

.column-headers span {
    min-width: 0;
    padding-right: 10px;
}

.column-headers span + span {
    border-left: 1px solid rgba(31, 53, 121, 0.28);
    padding-left: 10px;
}

.user-card {
    box-sizing: border-box;
    display: grid;
    grid-template-columns: 140px minmax(220px, 1fr) 70px 82px;
    align-items: center;
    min-height: 48px;
    padding: 6px 8px 6px 12px;
    border: 1px solid rgba(31, 53, 121, 0.18);
    border-radius: 10px;
    background: rgba(255, 255, 255, 0.55);
    text-align: left;
}

.user-card p {
    min-width: 0;
    margin: 0;
    padding: 4px 10px 4px 0;
    overflow-wrap: anywhere;
    white-space: normal;
}

.field-label {
    display: none;
}

.user-card p + p {
    border-left: 1px solid rgba(31, 53, 121, 0.18);
    padding-left: 10px;
}

.user-card button {
    width: auto !important;
    min-height: 34px !important;
    margin: 0 0 0 6px !important;
    padding: 6px 10px !important;
    border: 0;
    border-radius: 8px;
    background-color: #f4690d;
    color: white;
    font: inherit;
    font-size: 0.82rem;
    font-weight: 700;
    cursor: pointer;
}

.user-card button:hover {
    background-color: #ff7b28;
}

@media (max-width: 600px) {
    .column-headers {
        display: none;
    }

    .user-card {
        grid-template-columns: 1fr auto;
        gap: 3px 10px;
        min-height: 92px;
        padding: 10px;
    }

    .user-card p,
    .user-card p + p {
        grid-column: 1;
        border-left: 0;
        padding: 1px 0;
    }

    .field-label {
        display: block;
        color: #1f3579;
        font-size: 0.68rem;
        font-weight: 800;
        line-height: 1.1;
        text-transform: uppercase;
    }

    .user-card button {
        grid-column: 2;
        grid-row: 1 / 4;
        width: auto !important;
        margin: 0 !important;
    }
}
</style>