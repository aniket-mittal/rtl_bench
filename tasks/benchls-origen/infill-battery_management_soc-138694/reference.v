module origen_138694(
    input wire [7:0] voltage,
    input wire charge,
    input wire discharge,
    output reg [7:0] icharge,
    output reg [7:0] idischg,
    output reg [6:0] soc,
    output reg [6:0] soh
);

    // Internal signals
    wire [7:0] charge_current;
    wire [7:0] discharge_current;
    wire [6:0] soc_value;
    wire [6:0] soh_value;

    // Charging block
    charging_block charging (
        .voltage(voltage),
        .charge(charge),
        .icharge(charge_current)
    );

    // Discharging block
    discharging_block discharging (
        .voltage(voltage),
        .discharge(discharge),
        .idischg(discharge_current)
    );

    // Monitoring block
    monitoring_block monitoring (
        .voltage(voltage),
        .icharge(charge_current),
        .idischg(discharge_current),
        .soc(soc_value),
        .soh(soh_value)
    );

    // Output assignment
    always @(*) begin
        icharge = charge_current;
        idischg = discharge_current;
        soc = soc_value;
        soh = soh_value;
    end

endmodule

module charging_block(
    input wire [7:0] voltage,
    input wire charge,
    output reg [7:0] icharge
);

    always @(*) begin
        if (charge)
            icharge = (voltage < 8'h80) ? 8'h20 : 8'h10; // Example charging logic
        else
            icharge = 8'h00;
    end

endmodule

module discharging_block(
    input wire [7:0] voltage,
    input wire discharge,
    output reg [7:0] idischg
);

    always @(*) begin
        if (discharge)
            idischg = (voltage > 8'h40) ? 8'h30 : 8'h20; // Example discharging logic
        else
            idischg = 8'h00;
    end

endmodule

module monitoring_block(
    input wire [7:0] voltage,
    input wire [7:0] icharge,
    input wire [7:0] idischg,
    output reg [6:0] soc,
    output reg [6:0] soh
);

    reg [15:0] capacity;
    reg [15:0] total_charge;
    reg [15:0] total_discharge;

    always @(*) begin
        // Example SOC calculation
        capacity = 16'h1000; // Assumed battery capacity
        total_charge = icharge;
        total_discharge = idischg;
        soc = ((voltage - 8'h30) * 100) / (8'hC0 - 8'h30); // Linear approximation

        // Example SOH calculation
        soh = 100 - ((total_charge + total_discharge) * 100) / capacity;

        // Limit SOC and SOH to 0-100%
        if (soc > 7'd100) soc = 7'd100;
        if (soc < 7'd0) soc = 7'd0;
        if (soh > 7'd100) soh = 7'd100;
        if (soh < 7'd0) soh = 7'd0;
    end

endmodule