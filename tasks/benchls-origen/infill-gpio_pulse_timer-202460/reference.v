module origen_202460 (
    input clk,
    input rst_n,
    input [31:0] pulse1start,
    input [31:0] pulse1end,
    input startclock,
    output [5:0] gpio
);

reg [26:0] counter1;
reg [31:0] counter;
reg startflag;
reg startflag1;
reg startflag2;
reg [5:0] gpio_reg;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        startflag <= 1'b0;
        startflag1 <= 1'b0;
        startflag2 <= 1'b0;
        counter1 <= 27'b0;
        counter <= 32'b0;
        gpio_reg <= 6'b0;
    end else begin
        if (startclock) begin
            startflag <= 1'b1;
            counter1 <= 27'b0;
            counter <= 32'b0;
        end else begin
            if (startflag) begin
                counter1 <= counter1 + 1'b1;
                counter <= counter + 1'b1;
                if (counter1 == 27'h1c9c380) begin // 1 second
                    startflag1 <= 1'b1;
                end
                if (counter == pulse1start) begin
                    startflag2 <= 1'b1;
                    gpio_reg <= 6'b111111;
                end
                if (counter == pulse1end) begin
                    startflag2 <= 1'b0;
                    gpio_reg <= 6'b0;
                end
            end
        end
    end
end

assign gpio = gpio_reg;

endmodule