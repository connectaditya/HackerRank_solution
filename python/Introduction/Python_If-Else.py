def main():
    x = int(input())

    if x % 2 != 0:
        print("Weird", end="")

    elif x % 2 == 0 and 2 <= x <= 5:
        print("Not Weird", end="")

    elif x % 2 == 0 and 6 <= x <= 20:
        print("Weird", end="")

    elif x % 2 == 0 and x > 20:
        print("Not Weird", end="")


main()
