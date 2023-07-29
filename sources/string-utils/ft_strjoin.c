/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strjoin.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tanas <tanas@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/08 14:47:35 by tanas             #+#    #+#             */
/*   Updated: 2023/07/29 13:26:36 by tanas            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

/**
 * @brief Joins two strings 'stash' and 'buffer' into a new string.
 * The resulting string is a combination of both strings.
 *
 * @param stash The first part of the resulting string.
 * @param buffer The second part of the resulting string.
 * @return A pointer to the new concatenated string, or NULL
 * if memory allocation fails.
 */
char	*ft_strjoin(char *stash, char *buffer)
{
	char	*string;
	size_t	i;
	size_t	j;

	if (!stash)
	{
		stash = malloc(1);
		stash[0] = '\0';
	}
	if (!stash || !buffer)
		return (NULL);
	string = malloc(ft_strlen(stash) + ft_strlen(buffer) + 1);
	if (!string)
		return (NULL);
	i = -1;
	j = 0;
	if (stash)
		while (stash[++i])
			string[i] = stash[i];
	while (buffer[j])
		string[i++] = buffer[j++];
	string[i] = '\0';
	free(stash);
	return (string);
}
