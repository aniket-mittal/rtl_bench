module rtlpp_04311(
    input [3:0] addr,			
    input _devsel,				
    input fclk, 				
    input q3, 					
	input _reset,				
    input [7:0] dataIn,			
	output reg [7:0] dataOut,
    output reg wrdata,			
    output reg [3:0] phase,		
    output _wrreq,				
    output _enbl1,			   	
    output _enbl2,				
    input sense,				
    input rddata  				
);

    reg [7:0] shifter;
    reg [7:0] buffer; 
    reg motorOn;
    reg driveSelect;
    reg q6, q7;
    reg _underrun;
    reg writeBufferEmpty;

    always @(negedge _devsel or negedge _reset) begin
        if (_reset == 0) begin
            phase <= 4'b0000;
            motorOn <= 0;
            driveSelect <= 0;
            q6 <= 0;
            q7 <= 0;
        end
        else begin	
            case (addr[3:1])
                3'h0: phase[0] <= addr[0];
                3'h1: phase[1] <= addr[0];
                3'h2: phase[2] <= addr[0];
                3'h3: phase[3] <= addr[0];
                3'h4: motorOn <= addr[0];
                3'h5: driveSelect <= addr[0];
                3'h6: q6 <= addr[0];
                3'h7: q7 <= addr[0];
            endcase
        end
    end
    
    assign _enbl1 = ~(motorOn & ~driveSelect);
    assign _enbl2 = ~(motorOn & driveSelect);
    assign _wrreq = ~(q7 & _underrun & (_enbl1 == 0 | _enbl2 == 0));
    
    always @(*) begin
        case ({q7,q6}) 
            2'b00: dataOut <= buffer;
            2'b01: dataOut <= {sense, 1'b0, motorOn, 5'b00111}; 
            default: dataOut <= {writeBufferEmpty, _underrun, 6'b000000};
        endcase
    end
    
    reg [1:0] rddataSync;
    always @(posedge fclk) begin
        rddataSync <= {rddataSync[0], rddata};
    end

    wire q3orDev = q3 | _devsel;
    reg [5:0] bitTimer; 
    reg [2:0] bitCounter; 
    reg [3:0] clearBufferTimer; 

    always @(posedge fclk or negedge _reset) begin
        if (_reset == 0) begin
            _underrun <= 1'b1;
            writeBufferEmpty <= 1'b1;
            bitCounter <= 0;
            buffer <= 0;
            clearBufferTimer <= 0;
            wrdata <= 0;
        end
        else begin
            if (q7 == 0 && q6 == 0) begin
                if (clearBufferTimer == 0) begin
                    if (_devsel == 0 && addr[0] == 0 && buffer[7] == 1'b1) begin
                        clearBufferTimer <= 1; 
                    end
                end
                else begin
                    if (clearBufferTimer == 4'hE ) begin
                        buffer[7] <= 0; 
                        clearBufferTimer <= 0; 
                    end
                    else begin
                        clearBufferTimer <= clearBufferTimer + 1'b1;
                    end
                end
                if (rddataSync[1] & ~rddataSync[0]) begin
                    if (bitTimer >= 14) begin 
                        shifter <= {shifter[6:0], 1'b1}; 
                    end
                    bitTimer <= 0;
                end
                else begin
                    if (bitTimer >= 42) begin
                        shifter <= {shifter[6:0], 1'b0}; 
                        bitTimer <= 14; 
                    end
                    else begin					
                        if (shifter[7] == 1) begin
                            buffer <= shifter; 
                            shifter <= 0; 
                        end
                        bitTimer <= bitTimer + 1'b1;	
                    end	
                end
            end
            if (q7 == 1'b1) begin
                if (bitTimer == 28) begin
                    bitTimer <= 0;
                    if (bitCounter == 7) begin
                        bitCounter <= 0;
                        if (writeBufferEmpty == 0) begin
                            shifter <= buffer;
                            writeBufferEmpty <= 1'b1;						
                        end
                        else begin
                            _underrun <= 0; 
                        end		
                    end
                    else begin
                        bitCounter <= bitCounter + 1'b1;
                        shifter <= {shifter[6:0], 1'b0}; 
                    end
                end
                else begin
                    bitTimer <= bitTimer + 1'b1;
                end
                if (bitTimer == 1 && shifter[7] == 1) begin
                    wrdata <= ~wrdata;
                end		
            end
            else begin
                _underrun <= 1; 
            end
            if (q3orDev == 0 && q7 && q6 && addr[0]) begin
                if (motorOn) begin
                    buffer <= dataIn; 
                    writeBufferEmpty <= 0;
                end
                else begin
                    // No operation
                end
            end
        end
    end
endmodule