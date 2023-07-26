/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_number.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tanas <tanas@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/11 13:44:42 by tanas             #+#    #+#             */
/*   Updated: 2023/07/27 01:49:48 by tanas            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_print_number(int n)
{
	char	*number_as_string;
	int		length_of_print;

	number_as_string = ft_itoa(n);
	length_of_print = ft_print_string(number_as_string);
	free(number_as_string);
	return (length_of_print);
}
