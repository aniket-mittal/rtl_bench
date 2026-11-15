module origen_165828(
    input clk,
    input reset,
    output reg [3:0] an,
    output reg [6:0] sseg
);

reg [18:0] ms_count;
reg [8:0] displayed_number;
reg [20:0] refresh_count;
reg [1:0] LED_activating_counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        ms_count <= 0;
        displayed_number <= 0;
        refresh_count <= 0;
        LED_activating_counter <= 0;
    end
    else begin
        ms_count <= ms_count + 1;
        refresh_count <= refresh_count + 1;
        
        if (ms_count == 999_999) begin
            ms_count <= 0;
            displayed_number <= displayed_number + 1;
        end
        
        LED_activating_counter <= refresh_count[1:0];
    end
end

[MASKED]

endmodule