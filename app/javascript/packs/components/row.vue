<template>
  <tr>
    <td>{{ rate.destination }}</td>
    <td>{{ rate.flatRate }}</td>
    <td>{{ rate.flatRateCurrency }}</td>
    <td>{{ rate.id }}</td>
    <td>{{ rate.name }}</td>
    <td>{{ rate.origin }}</td>
    <td>{{ rate.rate }}</td>
    <td>{{ rate.serviceProviderId }}</td>
    <td>{{ rate.updatedAt }}</td>
  </tr>
</template>

<script>
export default {
  props: ['rate']
}
</script>

<style scoped>
</style>
