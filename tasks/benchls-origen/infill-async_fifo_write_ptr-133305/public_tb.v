// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_133305 dut (
    .w_clk(clk),
    .w_rst_n(in_vec[6:6]),
    .w_en(in_vec[5:5]),
    .r2w_ptr(in_vec[4:0]),
    .wbin(out_vec[17:13]),
    .wptr(out_vec[12:8]),
    .inc(out_vec[7:7]),
    .w_full(out_vec[6:6]),
    .w_counter(out_vec[5:1]),
    .w_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h34;
    stim[1] = 7'h2c;
    stim[2] = 7'h72;
    stim[3] = 7'h63;
    stim[4] = 7'h71;
    stim[5] = 7'h68;
    stim[6] = 7'h7a;
    stim[7] = 7'h1c;
    stim[8] = 7'h56;
    stim[9] = 7'h7b;
    stim[10] = 7'h54;
    stim[11] = 7'h5d;
    stim[12] = 7'h50;
    stim[13] = 7'h75;
    stim[14] = 7'h57;
    stim[15] = 7'h78;
    stim[16] = 7'h76;
    stim[17] = 7'h77;
    stim[18] = 7'h70;
    stim[19] = 7'h77;
    stim[20] = 7'h63;
    stim[21] = 7'h5a;
    stim[22] = 7'h67;
    stim[23] = 7'h5b;
    stim[24] = 7'h61;
    stim[25] = 7'h5f;
    stim[26] = 7'h4a;
    stim[27] = 7'h61;
    stim[28] = 7'h75;
    stim[29] = 7'h4d;
    stim[30] = 7'h7f;
    stim[31] = 7'h7e;
    stim[32] = 7'h6d;
    stim[33] = 7'h42;
    stim[34] = 7'h7f;
    stim[35] = 7'h48;
    stim[36] = 7'h75;
    stim[37] = 7'h40;
    stim[38] = 7'h45;
    stim[39] = 7'h4d;
    stim[40] = 7'h64;
    stim[41] = 7'h6c;
    stim[42] = 7'h41;
    stim[43] = 7'h6b;
    stim[44] = 7'h78;
    stim[45] = 7'h67;
    stim[46] = 7'h5b;
    stim[47] = 7'h52;
    stim[48] = 7'h5b;
    stim[49] = 7'h52;
    stim[50] = 7'h4b;
    stim[51] = 7'h4e;
    stim[52] = 7'h74;
    stim[53] = 7'h60;
    stim[54] = 7'h7e;
    stim[55] = 7'h6f;
    stim[56] = 7'h51;
    stim[57] = 7'h7f;
    stim[58] = 7'h4f;
    stim[59] = 7'h79;
    stim[60] = 7'h7b;
    stim[61] = 7'h7c;
    stim[62] = 7'h6c;
    stim[63] = 7'h79;
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
      expv[0] = 18'h00080;
      expv[1] = 18'h00080;
      expv[2] = 18'h00080;
      expv[3] = 18'h0218a;
      expv[4] = 18'h04380;
      expv[5] = 18'h0628a;
      expv[6] = 18'h0868a;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h0008a;
      expv[10] = 18'h0211e;
      expv[11] = 18'h02112;
      expv[12] = 18'h02116;
      expv[13] = 18'h02184;
      expv[14] = 18'h04312;
      expv[15] = 18'h04390;
      expv[16] = 18'h06286;
      expv[17] = 18'h08692;
      expv[18] = 18'h0a796;
      expv[19] = 18'h0c58e;
      expv[20] = 18'h0e49a;
      expv[21] = 18'h10c0c;
      expv[22] = 18'h10c8a;
      expv[23] = 18'h12d08;
      expv[24] = 18'h12d8e;
      expv[25] = 18'h14f12;
      expv[26] = 18'h14f0a;
      expv[27] = 18'h14f9c;
      expv[28] = 18'h16e94;
      expv[29] = 18'h18a06;
      expv[30] = 18'h18a86;
      expv[31] = 18'h1ab90;
      expv[32] = 18'h1c994;
      expv[33] = 18'h1e80c;
      expv[34] = 18'h1e898;
      expv[35] = 18'h00016;
      expv[36] = 18'h00082;
      expv[37] = 18'h02110;
      expv[38] = 18'h02102;
      expv[39] = 18'h02116;
      expv[40] = 18'h02190;
      expv[41] = 18'h04396;
      expv[42] = 18'h06216;
      expv[43] = 18'h06284;
      expv[44] = 18'h0868e;
      expv[45] = 18'h0a78a;
      expv[46] = 18'h0c502;
      expv[47] = 18'h0c508;
      expv[48] = 18'h0c514;
      expv[49] = 18'h0c508;
      expv[50] = 18'h0c514;
      expv[51] = 18'h0c512;
      expv[52] = 18'h0c596;
      expv[53] = 18'h0e49e;
      expv[54] = 18'h10c90;
      expv[55] = 18'h12d8a;
      expv[56] = 18'h14f00;
      expv[57] = 18'h14f98;
      expv[58] = 18'h16e0c;
      expv[59] = 18'h16e82;
      expv[60] = 18'h18a96;
      expv[61] = 18'h1ab96;
      expv[62] = 18'h1c98e;
      expv[63] = 18'h1e88e;
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
