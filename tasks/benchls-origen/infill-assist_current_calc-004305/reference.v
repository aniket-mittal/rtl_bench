module origen_004305 (
    input wire clk,
    input wire [11:0] avg_torque,
    input wire [4:0] cadence_vec,
    input wire [12:0] incline,
    input wire [1:0] setting,
    output reg [11:0] target_curr
);

    // Parameters
    parameter TORQUE_MIN = 12'd100;
    parameter INCLINE_MAX = 13'd4000;
    parameter INCLINE_MIN = -13'd4000;

    // Internal signals
    reg [12:0] incline_sat;
    reg [11:0] incline_factor, incline_lim;
    reg [7:0] cadence_factor;
    reg [11:0] torque_pos;
    reg [13:0] p1, p2;
    reg [25:0] assist_prod;

    // Incline processing
    always @(*) begin
        if (incline > INCLINE_MAX)
            incline_sat = INCLINE_MAX;
        else if (incline < INCLINE_MIN)
            incline_sat = INCLINE_MIN;
        else
            incline_sat = incline;
        
        incline_factor = (incline_sat >>> 1) + 12'd2048;
        incline_lim = (incline_factor > 12'd4095) ? 12'd4095 : incline_factor;
    end

    // Cadence processing
    always @(*) begin
        cadence_factor = {3'b0, cadence_vec} + 8'd32;
    end

    // Torque processing
    always @(*) begin
        torque_pos = (avg_torque > TORQUE_MIN) ? (avg_torque - TORQUE_MIN) : 12'd0;
    end

    // Assistance calculation pipeline
    always @(posedge clk) begin
        p1 <= {6'b0, setting} * cadence_factor;
        p2 <= p1 * incline_lim;
        assist_prod <= p2 * torque_pos;
    end

    // Target current determination
    always @(posedge clk) begin
        target_curr <= (assist_prod[25:12] > 12'hFFF) ? 12'hFFF : assist_prod[23:12];
    end

endmodule