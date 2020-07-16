xbus_slave_agent slave[2];

string instance_name;

int i = 0;

begin
if (i <= 3) $sformat(instance_name, "slave[%d]", i);
// string will be stored in the instance_name by replacing the %d with the value of i
slave[0] = xbus_slave::type_id::create(instance_name, this);
i <= i+1;

end

// Two slaves will be created with the instance names... slave[0], slave[1]