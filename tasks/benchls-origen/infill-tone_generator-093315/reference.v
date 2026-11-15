module origen_093315(
    input clk,
    input [1:0] sw,
    output reg signalout
);

    reg [3:0] progress;
    reg [31:0] mycounter1, mycounter2;
    reg [31:0] countlow, counthigh;
    
    parameter myonesecond = 50000000;

    initial begin
        progress = 4'b0001;
        mycounter1 = 32'b0;
        mycounter2 = 32'b0;
        signalout = 1'b0;
    end

    always @(posedge clk) begin
        case (progress)
            4'b0001: begin countlow <= 32'd113636; counthigh <= 32'd227272; progress <= 4'b0000; end
            4'b0010: begin countlow <= 32'd107259; counthigh <= 32'd214518; progress <= 4'b0000; end
            4'b0011: begin countlow <= 32'd101239; counthigh <= 32'd202478; progress <= 4'b0000; end
            4'b0100: begin countlow <= 32'd95602;  counthigh <= 32'd191204; progress <= 4'b0000; end
            4'b0101: begin countlow <= 32'd90252;  counthigh <= 32'd180504; progress <= 4'b0000; end
            4'b0110: begin countlow <= 32'd85179;  counthigh <= 32'd170358; progress <= 4'b0000; end
            4'b0111: begin countlow <= 32'd80386;  counthigh <= 32'd160772; progress <= 4'b0000; end
            4'b1000: begin countlow <= 32'd75838;  counthigh <= 32'd151676; progress <= 4'b0000; end
            4'b1001: begin countlow <= 32'd71633;  counthigh <= 32'd143266; progress <= 4'b0000; end
            4'b1010: begin countlow <= 32'd67567;  counthigh <= 32'd135134; progress <= 4'b0000; end
            4'b1011: begin countlow <= 32'd63776;  counthigh <= 32'd127552; progress <= 4'b0000; end
            4'b1100: begin countlow <= 32'd60168;  counthigh <= 32'd120336; progress <= 4'b0000; end
            4'b0000: begin
                mycounter1 <= mycounter1 + 1;
                mycounter2 <= mycounter2 + 1;
                
                if (mycounter1 >= countlow && mycounter1 < counthigh)
                    signalout <= 1'b1;
                else if (mycounter1 >= counthigh)
                    begin
                        signalout <= 1'b0;
                        mycounter1 <= 32'b0;
                    end
                
                if (mycounter2 >= myonesecond) begin
                    mycounter2 <= 32'b0;
                    progress <= (progress == 4'b1100) ? 4'b0001 : progress + 1;
                end
            end
            default: progress <= 4'b0001;
        endcase
    end

endmodule