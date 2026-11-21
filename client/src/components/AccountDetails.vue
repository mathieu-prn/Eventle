<template>
  <div class="account-details">
    <h2>Account Details</h2>
    <template v-if="modifying === 'none'">
        <div id="username_cont">
        <p><strong>Username:</strong> {{ user.username }}</p>
        <button @click="modifying='username'">Edit Username</button>
        </div>
        <div id="email_cont">
            <p><strong>Email:</strong> {{ user.email }}</p>
            <button @click="modifying='email'">Edit Email</button>
        </div>
        <div id="password_cont">
            <p><strong>Password:</strong> ********</p>
            <button @click="modifying='password'">Edit Password</button>
        </div>
        <br>
        <button @click="$emit('closeDetails')">Close</button>
    </template>
    <template v-else-if="modifying === 'username'">
        <p>Modify Username</p>
        <form @submit.prevent="saveChanges">
            <input v-model="newUsername" type="text" placeholder="New Username"/>
            <button type="submit">Save</button>
        </form>
    </template>
    <template v-else-if="modifying === 'email'">
        <p>Modify Email</p>
        <form @submit.prevent="saveChanges">
            <input v-model="newEmail" type="email" placeholder="New Email"/>
            <button type="submit">Save</button>
        </form>
    </template>
    <template v-else-if="modifying === 'password'">
        <p>Modify Password</p>
        <form @submit.prevent="saveChanges">
            <input v-model="oldPassword" type="password" placeholder="Old Password"/>
            <input v-model="newPassword" type="password" placeholder="New Password"/>
            <button type="submit">Save</button>
        </form>
    </template>
    <br>
    <button v-if="modifying !== 'none'" @click="modifying='none'">Cancel</button>
  </div>
</template>

<script>
import axios from 'axios';
  export default {
    data() {
        return {
            modifying: "none",
            newUsername: "",
            newEmail: "",
            newPassword: "",
            oldPassword: ""
        };
    },
    props: {
      user: {
        type: Object,
        required: true
      }
    },
    methods :{
        async saveChanges() {
            try {
            const payload = {};

            if (this.newUsername) payload.new_username = this.newUsername;
            if (this.newEmail) payload.new_email = this.newEmail;
            if (this.newPassword) {
                payload.new_password = this.newPassword;
                payload.old_password = this.oldPassword;
            }

            const response = await axios.post(
                'http://localhost:3000/updatedetails',
                payload,
                {
                    headers: {
                        Authorization: `Bearer ${localStorage.getItem('accessToken')}`
                    }
                }
            );
            if (response.data.success) {
                alert('Modification successful!');
                this.$emit('updateUser', response.data.user);
            } else {
                alert('Modification failed. Please try again.');
            }
        } catch (error) {
            console.error('Error during Modification:', error);
            alert('An error occurred during modification. Please try again later.');
        }
        }
    }
  };
</script>

<style scoped>
.account-details {
  box-sizing: border-box;
  width: min(100% - 40px, 560px);
  margin: 32px auto;
  padding: 36px 40px;
  background-color: #1f3579;
  color: white;
  border-radius: 32px;
  box-shadow: 12px 12px #f4690d;
}

.account-details h2 {
  margin: 0 0 28px;
  text-align: center;
  font-size: 1.8rem;
}

.account-details p {
  margin: 0;
  color: #fff2db;
  line-height: 1.5;
}

.account-details strong {
  color: white;
}

#username_cont,
#email_cont,
#password_cont {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 20px;
  padding: 18px 0;
  border-bottom: 1px solid rgb(255 242 219 / 35%);
}

#username_cont button,
#email_cont button,
#password_cont button {
  flex-shrink: 0;
}

.account-details button {
  min-height: 44px;
  padding: 10px 18px;
  border: 0;
  border-radius: 12px;
  background-color: #f4690d;
  color: white;
  font: inherit;
  font-weight: 700;
  cursor: pointer;
  transition: transform 0.2s, box-shadow 0.2s, background-color 0.2s;
}

.account-details button:hover {
  background-color: #ff7b28;
  transform: translateY(-2px);
  box-shadow: 4px 4px #fff2db;
}

.account-details > button:not([type="submit"]) {
  display: block;
  margin: 28px auto 0;
}

.account-details form {
  display: flex;
  flex-direction: column;
  gap: 14px;
  margin-top: 20px;
}

.account-details input {
  box-sizing: border-box;
  width: 100%;
  padding: 14px 16px;
  border: 2px solid transparent;
  border-radius: 12px;
  background-color: #fff2db;
  color: #1f3579;
  font: inherit;
}

.account-details input::placeholder {
  color: #66749b;
}

.account-details input:focus {
  outline: none;
  border-color: #f4690d;
  box-shadow: 0 0 0 3px rgb(244 105 13 / 25%);
}

.account-details form + br + button {
  display: block;
  margin: 28px auto 0;
  background-color: #fff2db;
  color: #1f3579;
}

.account-details form + br + button:hover {
  background-color: white;
  box-shadow: 4px 4px #f4690d;
}

@media (max-width: 520px) {
  .account-details {
    width: calc(100% - 40px);
    margin: 24px auto;
    padding: 30px 24px;
    border-radius: 24px;
  }

  #username_cont,
  #email_cont,
  #password_cont {
    align-items: flex-start;
    flex-direction: column;
    gap: 12px;
  }

  #username_cont button,
  #email_cont button,
  #password_cont button {
    width: 100%;
  }
}
</style>