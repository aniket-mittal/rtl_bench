module origen_119074 (
    input wire clk,
    input wire reset_n,
    input wire ew_sensor,
    input wire emgcy_sensor,
    output reg [2:0] ns_light,
    output reg [2:0] ew_light
);

    localparam [2:0] OFF = 3'b000,
                     RED = 3'b001,
                     YELLOW = 3'b010,
                     GREEN = 3'b100,
                     PRE_GREEN = 3'b110;

    reg [2:0] ns_state, ns_next_state;
    reg [2:0] ew_state, ew_next_state;
    
    reg [3:0] ns_green_timer, ew_green_timer;
    parameter MAX_GREEN_TIME = 4'd11;

    // Timer logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            ns_green_timer <= 4'd0;
            ew_green_timer <= 4'd0;
        end else begin
            if (ns_state == GREEN)
                ns_green_timer <= (ns_green_timer == MAX_GREEN_TIME) ? 4'd0 : ns_green_timer + 1;
            else
                ns_green_timer <= 4'd0;

            if (ew_state == GREEN)
                ew_green_timer <= (ew_green_timer == MAX_GREEN_TIME) ? 4'd0 : ew_green_timer + 1;
            else
                ew_green_timer <= 4'd0;
        end
    end

    // State transition logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            ns_state <= RED;
            ew_state <= RED;
        end else begin
            ns_state <= ns_next_state;
            ew_state <= ew_next_state;
        end
    end

    // Next state logic
    [MASKED]

    // Output logic
    always @(*) begin
        ns_light = ns_state;
        ew_light = ew_state;
    end

endmodule

module TLC_TB;
    reg clk;
    reg reset_n;
    reg ew_sensor;
    reg emgcy_sensor;
    wire [2:0] ns_light;
    wire [2:0] ew_light;

    trafficlight dut (
        .clk(clk),
        .reset_n(reset_n),
        .ew_sensor(ew_sensor),
        .emgcy_sensor(emgcy_sensor),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Test stimulus
    initial begin
        reset_n = 0;
        ew_sensor = 0;
        emgcy_sensor = 0;
        
        #20 reset_n = 1;
        
        #200 ew_sensor = 1;
        #100 ew_sensor = 0;
        
        #300 emgcy_sensor = 1;
        #20 emgcy_sensor = 0;
        
        #500 ew_sensor = 1;
        #200 ew_sensor = 0;
        
        #1000 ;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t ns_light=%b ew_light=%b", $time, ns_light, ew_light);
    end

endmodule