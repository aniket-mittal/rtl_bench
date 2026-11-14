module rtlpp_01557 (
	clk,
	rstn,
	sample,
	raw_data_in,
	ave_data_out,
    data_out_valid);

parameter 
ADC_WIDTH = 8,				
LPF_DEPTH_BITS = 4;         


input	clk;                                
input	rstn;	                            
input	sample;				                
input	[ADC_WIDTH-1:0]	raw_data_in;		


output [ADC_WIDTH-1:0]	ave_data_out;		
output data_out_valid;                      

reg [ADC_WIDTH-1:0]	ave_data_out;		





reg [ADC_WIDTH+LPF_DEPTH_BITS-1:0]      accum;          
reg [LPF_DEPTH_BITS-1:0]                count;          
reg [ADC_WIDTH-1:0]  					raw_data_d1;    

reg sample_d1, sample_d2;                               
reg result_valid;                                       
wire accumulate;                                        
wire latch_result;                                      






always @(posedge clk or negedge rstn)
begin
	if( rstn == 1'b0 ) begin
		sample_d1 <= 1'b0;	
		sample_d2 <= 1'b0;
        raw_data_d1 <= {ADC_WIDTH{1'b0}};
		result_valid <= 1'b0;
	end else begin
		sample_d1 <= sample;                
		sample_d2 <= sample_d1;             
		raw_data_d1 <= raw_data_in; 	    
		result_valid <= latch_result;		
	end
end

assign		accumulate = sample_d1 && !sample_d2;	    
assign		latch_result = accumulate && (count == {LPF_DEPTH_BITS{1'b0}});	






always @(posedge clk or negedge rstn)
begin
	if( rstn == 1'b0 ) begin
		count <= {LPF_DEPTH_BITS{1'b0}};	  
	end else begin
	    if (accumulate)	count <= count + 1;         
	end
end







always @(posedge clk or negedge rstn)
begin
	if( rstn == 1'b0 ) begin
		accum <= {ADC_WIDTH+LPF_DEPTH_BITS{1'b0}};	
	end else begin
        if (accumulate)
            if(count == {LPF_DEPTH_BITS{1'b0}})                      
    		    accum <= raw_data_d1;           
            else
                accum <= accum + raw_data_d1;   
	end	
end
	







always @(posedge clk or negedge rstn)
begin
	if( rstn == 1'b0 ) begin
        ave_data_out <= {ADC_WIDTH{1'b0}};
    end else if (latch_result) begin            
        ave_data_out <= accum >> LPF_DEPTH_BITS;	  
    end
end

assign data_out_valid = result_valid;       

endmodule