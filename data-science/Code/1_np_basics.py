import numpy as np


def sigmoid(x):
    """
    Compute the sigmoid of x

    Arguments:
    x -- A scalar or numpy array of any size

    Return:
    s -- sigmoid(x)
    """
    s = 1 / (1 + np.exp(-x))

    return s


def sigmoid_derivative(x):
    """
    Compute the gradient (also called the slope or derivative) of the sigmoid function with respect to its input x.
    You can store the output of the sigmoid function into variables and then use it to calculate the gradient.

    Arguments:
    x -- A scalar or numpy array

    Return:
    ds -- Your computed gradient.
    """
    s = sigmoid
    ds = s(x) * (1 - s(x))

    return ds


def image2vector(image):
    """
    Argument:
    image -- a numpy array of shape (length, height, depth)

    Returns:
    v -- a vector of shape (length*height*depth, 1)
    """
    print(image.shape)
    v = image.reshape((image.shape[0] * image.shape[1] * image.shape[2], 1))

    return v


def normalize_rows(x):
    """
    Implement a function that normalizes each row of the matrix x (to have unit length).

    Argument:
    x -- A numpy matrix of shape (n, m)

    Returns:
    x -- The normalized (by row) numpy matrix. You are allowed to modify x.
    """
    x_norm = np.linalg.norm(x, ord=2, axis=1, keepdims=True)
    x = x / x_norm

    return x


def softmax(x):
    """Calculates the softmax for each row of the input x.

    Your code should work for a row vector and also for matrices of shape (m,n).

    Argument:
    x -- A numpy matrix of shape (m,n)

    Returns:
    s -- A numpy matrix equal to the softmax of x, of shape (m,n)
    """

    # Apply exp() element-wise to x. Use np.exp(...).
    x_exp = np.exp(x)

    # Create a vector x_sum that sums each row of x_exp. Use np.sum(..., axis = 1, keepdims = True).
    x_sum = np.sum(x_exp, axis=1, keepdims=True)

    # Compute softmax(x) by dividing x_exp by x_sum. It should automatically use numpy broadcasting.
    s = x_exp / x_sum

    return s


def L1(yhat, y):
    """
    Arguments:
    yhat -- vector of size m (predicted labels)
    y -- vector of size m (true labels)

    Returns:
    loss -- the value of the L1 loss function defined above
    """
    # loss = np.sum(abs(y - yhat))
    loss = np.sum(np.square(y - yhat))

    return loss


def main():
    # Calculate the sigmoids of the vector
    t_x = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 100, 1000])
    print(f"sigmoid(t_x) = {sigmoid(t_x)}")

    # Calculate the sigmoid derivative
    t_x = np.array([1, 2, 3])
    print(f"sigmoid_derivative(t_x) = {sigmoid_derivative(t_x)}")

    # Print the shape of t_x
    print(t_x.shape)

    # np.reshape
    # This is a 3 by 3 by 2 array, typically images will be (num_px_x, num_px_y, 3)
    #  where 3 represents the RGB values
    t_image = np.array(
        [
            [
                [0.67826139, 0.29380381],
                [0.90714982, 0.52835647],
                [0.4215251, 0.45017551],
            ],
            [
                [0.92814219, 0.96677647],
                [0.85304703, 0.52351845],
                [0.19981397, 0.27417313],
            ],
            [
                [0.60659855, 0.00533165],
                [0.10820313, 0.49978937],
                [0.34144279, 0.94630077],
            ],
        ]
    )
    print("image2vector(image) = " + str(image2vector(t_image)))

    # Normalization
    x = np.array([[0.0, 3.0, 4.0], [1.0, 6.0, 4.0]])
    print("normalizeRows(x) = " + str(normalize_rows(x)))

    # Softmax
    t_x = np.array([[9, 2, 5, 0, 0], [7, 5, 0, 0, 0]])
    print("softmax(x) = " + str(softmax(t_x)))

    # Loss function
    yhat = np.array([0.9, 0.2, 0.1, 0.4, 0.9])
    y = np.array([1, 0, 0, 1, 1])
    print("L1 = " + str(L1(yhat, y)))


if __name__ == "__main__":
    main()
