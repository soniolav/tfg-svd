function a = house_vector(a)
if a(1) == 0
    a(1) = norm(a);
else
    a(1) = a(1) + sign(a(1)) * norm(a);
end

