module origen_214188 (
    input        clk,
    input        rst,
    input  [7:0] up_bus,
    input        up_val,
    input        dn_rdy,
    output       up_rdy,
    output [7:0] dn_bus,
    output       dn_val
);

    reg [7:0] skid_bus;
    reg       skid_val;
    reg       dn_active;

    assign up_rdy = dn_active | ~skid_val;
    assign dn_bus = dn_active ? up_bus : skid_bus;
    assign dn_val = dn_active ? up_val : skid_val;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            skid_bus <= 0;
            skid_val <= 0;
            dn_active <= 0;
        end
        else begin
            if (up_val & ~up_rdy) begin
                skid_bus <= up_bus;
                skid_val <= 1;
            end
            if (dn_rdy) begin
                dn_active <= 1;
                if (up_rdy) begin
                    skid_val <= 0;
                end
            end
            else begin
                dn_active <= 0;
            end
        end
    end

    // Formal Verification Assertions
    `ifdef FORMAL
    reg f_up_val_prev;
    [MASKED]
    `endif

endmodule