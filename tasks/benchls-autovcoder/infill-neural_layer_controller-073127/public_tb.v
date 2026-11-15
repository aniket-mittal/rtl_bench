// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_073127 dut (
    .clk(clk),
    .Computing_Signal(in_vec[44:44]),
    .Computation_Step_Counter(in_vec[43:38]),
    .L0_Computation_Step_Counter(in_vec[37:33]),
    .L0_Weight_Loading_Counter(in_vec[32:22]),
    .L0_Input_Loading_Counter(in_vec[21:11]),
    .L0_Output_Loading_Counter(in_vec[10:0]),
    .L0_Weight_Status(out_vec[5:4]),
    .L0_Input_Status(out_vec[3:2]),
    .L0_Output_Status(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h0c2d52328434;
    stim[1] = 45'h1daf39a74fbd;
    stim[2] = 45'h01bf072b563d;
    stim[3] = 45'h1113c1a59a37;
    stim[4] = 45'h15692aafeda2;
    stim[5] = 45'h11b87820eded;
    stim[6] = 45'h1e1e0f23f30a;
    stim[7] = 45'h0800db78a064;
    stim[8] = 45'h08ba8edb7c88;
    stim[9] = 45'h139c99ca817a;
    stim[10] = 45'h055574bce4f4;
    stim[11] = 45'h0ab50c084c0d;
    stim[12] = 45'h035adbe5563c;
    stim[13] = 45'h04ec867dbba6;
    stim[14] = 45'h006d97337172;
    stim[15] = 45'h19b69ea94d7b;
    stim[16] = 45'h15c79c3dfa6a;
    stim[17] = 45'h03a572646357;
    stim[18] = 45'h1da315ab92fb;
    stim[19] = 45'h0948fb5775e1;
    stim[20] = 45'h03f2fe3b0847;
    stim[21] = 45'h0ba589ade78d;
    stim[22] = 45'h13c526e9aaa6;
    stim[23] = 45'h0bfeb2d4b69d;
    stim[24] = 45'h1da60030ef96;
    stim[25] = 45'h014d3f037568;
    stim[26] = 45'h04ae5852ee68;
    stim[27] = 45'h038191675073;
    stim[28] = 45'h031daa218e26;
    stim[29] = 45'h019d2cf304b7;
    stim[30] = 45'h0c26adebb6de;
    stim[31] = 45'h081129c1b792;
    stim[32] = 45'h0bca2b76e030;
    stim[33] = 45'h02ef6e7f534b;
    stim[34] = 45'h1f4018f44be6;
    stim[35] = 45'h1996735281c6;
    stim[36] = 45'h12b93d2ca3c3;
    stim[37] = 45'h112e819e031b;
    stim[38] = 45'h044c87da6ac6;
    stim[39] = 45'h1951df3489f5;
    stim[40] = 45'h02e7a3787a3d;
    stim[41] = 45'h0bc026ca4722;
    stim[42] = 45'h1ac18b0c902a;
    stim[43] = 45'h10658af63feb;
    stim[44] = 45'h057cc6412047;
    stim[45] = 45'h1e0942d111a5;
    stim[46] = 45'h1b4569457e59;
    stim[47] = 45'h0caa28d3694f;
    stim[48] = 45'h0fad780cd90c;
    stim[49] = 45'h126371c03f27;
    stim[50] = 45'h11d5400aac28;
    stim[51] = 45'h151f786fb58e;
    stim[52] = 45'h16bd8fdca981;
    stim[53] = 45'h03284925f173;
    stim[54] = 45'h00f2e078694a;
    stim[55] = 45'h1a75be794699;
    stim[56] = 45'h13eb9dbd45e8;
    stim[57] = 45'h120a190b620b;
    stim[58] = 45'h1ea61d3bd28b;
    stim[59] = 45'h0228d9972ec8;
    stim[60] = 45'h142fd4e5b447;
    stim[61] = 45'h1431dacfd5fa;
    stim[62] = 45'h1f056b7f7e3b;
    stim[63] = 45'h165376b6b0f2;
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
      expv[0] = 6'hxx;
      expv[1] = 6'hxx;
      expv[2] = 6'h15;
      expv[3] = 6'h15;
      expv[4] = 6'h15;
      expv[5] = 6'h15;
      expv[6] = 6'h15;
      expv[7] = 6'h15;
      expv[8] = 6'h15;
      expv[9] = 6'h15;
      expv[10] = 6'h15;
      expv[11] = 6'h15;
      expv[12] = 6'h15;
      expv[13] = 6'h15;
      expv[14] = 6'h15;
      expv[15] = 6'h15;
      expv[16] = 6'h15;
      expv[17] = 6'h15;
      expv[18] = 6'h15;
      expv[19] = 6'h15;
      expv[20] = 6'h15;
      expv[21] = 6'h15;
      expv[22] = 6'h15;
      expv[23] = 6'h15;
      expv[24] = 6'h15;
      expv[25] = 6'h15;
      expv[26] = 6'h15;
      expv[27] = 6'h15;
      expv[28] = 6'h15;
      expv[29] = 6'h15;
      expv[30] = 6'h15;
      expv[31] = 6'h15;
      expv[32] = 6'h15;
      expv[33] = 6'h15;
      expv[34] = 6'h15;
      expv[35] = 6'h15;
      expv[36] = 6'h15;
      expv[37] = 6'h15;
      expv[38] = 6'h15;
      expv[39] = 6'h15;
      expv[40] = 6'h15;
      expv[41] = 6'h15;
      expv[42] = 6'h15;
      expv[43] = 6'h15;
      expv[44] = 6'h15;
      expv[45] = 6'h15;
      expv[46] = 6'h15;
      expv[47] = 6'h15;
      expv[48] = 6'h15;
      expv[49] = 6'h15;
      expv[50] = 6'h15;
      expv[51] = 6'h15;
      expv[52] = 6'h15;
      expv[53] = 6'h15;
      expv[54] = 6'h15;
      expv[55] = 6'h15;
      expv[56] = 6'h15;
      expv[57] = 6'h15;
      expv[58] = 6'h15;
      expv[59] = 6'h15;
      expv[60] = 6'h15;
      expv[61] = 6'h15;
      expv[62] = 6'h15;
      expv[63] = 6'h15;
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
