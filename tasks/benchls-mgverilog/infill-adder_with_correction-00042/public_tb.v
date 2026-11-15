// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 31;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00042 dut (
    .clk(clk),
    .rst(in_vec[51:51]),
    .arg_0(in_vec[50:50]),
    .arg_1(in_vec[49:49]),
    .arg_2(in_vec[48:28]),
    .arg_3(in_vec[27:7]),
    .arg_4(in_vec[6:2]),
    .arg_5(in_vec[1:1]),
    .arg_6(in_vec[0:0]),
    .ret_0(out_vec[30:9]),
    .ret_1(out_vec[8:8]),
    .ret_2(out_vec[7:7]),
    .ret_3(out_vec[6:2]),
    .ret_4(out_vec[1:1]),
    .ret_5(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'ha71f075cd4fe2;
    stim[1] = 52'hf10f6c771b2e2;
    stim[2] = 52'h5b211d12dfcf5;
    stim[3] = 52'h606e2d4e491c5;
    stim[4] = 52'h7153ecb05c05a;
    stim[5] = 52'h2bfec6fa8e72c;
    stim[6] = 52'h67c275b564d20;
    stim[7] = 52'h0c49176314957;
    stim[8] = 52'h47c3d081267e7;
    stim[9] = 52'h66a6c2ff3f2b2;
    stim[10] = 52'h2f95391ef6cda;
    stim[11] = 52'h68334a2eecb79;
    stim[12] = 52'h7e30338b07548;
    stim[13] = 52'hb09f150f49bec;
    stim[14] = 52'h4b90300a8e47a;
    stim[15] = 52'h637418eec744d;
    stim[16] = 52'h0055593313471;
    stim[17] = 52'h3cf83708335db;
    stim[18] = 52'h38891adff203a;
    stim[19] = 52'h606f42d42dd6c;
    stim[20] = 52'h57d3b78d197f0;
    stim[21] = 52'h61a41076c750b;
    stim[22] = 52'h4c37f4ccac1fe;
    stim[23] = 52'h140bdca742cc3;
    stim[24] = 52'h486228d17bd8b;
    stim[25] = 52'h5a80aa7e181b3;
    stim[26] = 52'h5c17c0559808c;
    stim[27] = 52'h7b138b9e5baba;
    stim[28] = 52'h2e6d4325e4f64;
    stim[29] = 52'h6d6616b7332eb;
    stim[30] = 52'h0f6b8cb09a46c;
    stim[31] = 52'h5830d9e1e32ef;
    stim[32] = 52'h24e96ff0dc299;
    stim[33] = 52'h57f60942fbbc5;
    stim[34] = 52'h2a7701e8501cf;
    stim[35] = 52'h5297972a0e045;
    stim[36] = 52'h1aa7fa0d76059;
    stim[37] = 52'h79b09a91c2dc6;
    stim[38] = 52'h0dd22d2d83364;
    stim[39] = 52'h5a81b6015c9be;
    stim[40] = 52'h2a090ac68563d;
    stim[41] = 52'h796a02a37f32e;
    stim[42] = 52'h32205c143a3ba;
    stim[43] = 52'h6ad96b6dac395;
    stim[44] = 52'h49a204e3b0288;
    stim[45] = 52'h243b57f48037c;
    stim[46] = 52'h7a1db8cffb9c4;
    stim[47] = 52'h1654684d5df7e;
    stim[48] = 52'h43fd6baa369af;
    stim[49] = 52'h118b38675d146;
    stim[50] = 52'h6e03245dffab0;
    stim[51] = 52'h27533b316311b;
    stim[52] = 52'h6667c17e7cea5;
    stim[53] = 52'h5b87f97f29172;
    stim[54] = 52'h4136aa2798e19;
    stim[55] = 52'h9dc3f3268df98;
    stim[56] = 52'h6b4d741562e0d;
    stim[57] = 52'h4aea4efd4fee7;
    stim[58] = 52'h6b575909ea4d8;
    stim[59] = 52'h78da4149ba569;
    stim[60] = 52'h17bd120bd6819;
    stim[61] = 52'hd12a3e5073549;
    stim[62] = 52'h21534a8f31945;
    stim[63] = 52'h3800424fe3eb7;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 31'h25734ee2;
      expv[1] = 31'h3fe5a5e2;
      expv[2] = 31'h3afa2f75;
      expv[3] = 31'h146ea3c5;
      expv[4] = 31'h4ebedbda;
      expv[5] = 31'h56a128ac;
      expv[6] = 31'h3cde1fa0;
      expv[7] = 31'h31575257;
      expv[8] = 31'h2fd13f67;
      expv[9] = 31'h4d1d51b2;
      expv[10] = 31'h26e826da;
      expv[11] = 31'h1c21c3f9;
      expv[12] = 31'h5f223bc8;
      expv[13] = 31'h251098ec;
      expv[14] = 31'h19c3f37a;
      expv[15] = 31'h429a03cd;
      expv[16] = 31'h0d6f8471;
      expv[17] = 31'h3bfd44db;
      expv[18] = 31'h690eb6ba;
      expv[19] = 31'h35e9f9ec;
      expv[20] = 31'h52edcd70;
      expv[21] = 31'h20f9f58b;
      expv[22] = 31'h4b9af17e;
      expv[23] = 31'h51e86a43;
      expv[24] = 31'h4523470b;
      expv[25] = 31'h54875b33;
      expv[26] = 31'h4d95830c;
      expv[27] = 31'h5dbe03ba;
      expv[28] = 31'h2653c2e4;
      expv[29] = 31'h4898f7eb;
      expv[30] = 31'h4afda86c;
      expv[31] = 31'h68da7d6f;
      expv[32] = 31'h4609ea99;
      expv[33] = 31'h40ab0345;
      expv[34] = 31'h4f0208cf;
      expv[35] = 31'h2fb2b145;
      expv[36] = 31'h38ad7659;
      expv[37] = 31'h57d1edc6;
      expv[38] = 31'h27052664;
      expv[39] = 31'h355a953e;
      expv[40] = 31'h45b36ebd;
      expv[41] = 31'h5bb3d3ae;
      expv[42] = 31'h294f48ba;
      expv[43] = 31'h311de795;
      expv[44] = 31'h4c301308;
      expv[45] = 31'h4596bafc;
      expv[46] = 31'h683a57c4;
      expv[47] = 31'h40004e7e;
      expv[48] = 31'h32887d2f;
      expv[49] = 31'h3cedb646;
      expv[50] = 31'h338633b0;
      expv[51] = 31'h1aff3a9b;
      expv[52] = 31'h2c6ebfa5;
      expv[53] = 31'h56da3972;
      expv[54] = 31'h0c538f19;
      expv[55] = 31'h452b6418;
      expv[56] = 31'h1bf3a38d;
      expv[57] = 31'h55289767;
      expv[58] = 31'h192945d8;
      expv[59] = 31'h442319e9;
      expv[60] = 31'h326fc619;
      expv[61] = 31'h36715349;
      expv[62] = 31'h2672fac5;
      expv[63] = 31'h43f97eb7;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
