// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_103879 dut (
    .mode(in_vec[7:6]),
    .opcode(in_vec[5:2]),
    .S_ID(in_vec[1:1]),
    .mux_cc(in_vec[0:0]),
    .exe_cmd(out_vec[9:6]),
    .MEM_R_EN(out_vec[5:5]),
    .MEM_W_EN(out_vec[4:4]),
    .WB_EN(out_vec[3:3]),
    .B(out_vec[2:2]),
    .S(out_vec[1:1]),
    .move_HZRD(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h52;
    stim[1] = 8'h8e;
    stim[2] = 8'he1;
    stim[3] = 8'h0d;
    stim[4] = 8'h80;
    stim[5] = 8'he8;
    stim[6] = 8'h7c;
    stim[7] = 8'h0e;
    stim[8] = 8'h68;
    stim[9] = 8'hb0;
    stim[10] = 8'hde;
    stim[11] = 8'h79;
    stim[12] = 8'ha0;
    stim[13] = 8'h39;
    stim[14] = 8'h37;
    stim[15] = 8'h58;
    stim[16] = 8'h65;
    stim[17] = 8'h99;
    stim[18] = 8'hfb;
    stim[19] = 8'h4f;
    stim[20] = 8'h1a;
    stim[21] = 8'h80;
    stim[22] = 8'h66;
    stim[23] = 8'h3e;
    stim[24] = 8'hc1;
    stim[25] = 8'hce;
    stim[26] = 8'hda;
    stim[27] = 8'h8e;
    stim[28] = 8'he2;
    stim[29] = 8'h6b;
    stim[30] = 8'h0f;
    stim[31] = 8'h16;
    stim[32] = 8'h51;
    stim[33] = 8'hd6;
    stim[34] = 8'h43;
    stim[35] = 8'h07;
    stim[36] = 8'hdc;
    stim[37] = 8'hf9;
    stim[38] = 8'he0;
    stim[39] = 8'h4f;
    stim[40] = 8'hd4;
    stim[41] = 8'h70;
    stim[42] = 8'h53;
    stim[43] = 8'h27;
    stim[44] = 8'h6c;
    stim[45] = 8'h5b;
    stim[46] = 8'ha4;
    stim[47] = 8'h2a;
    stim[48] = 8'h08;
    stim[49] = 8'h52;
    stim[50] = 8'h68;
    stim[51] = 8'he5;
    stim[52] = 8'h97;
    stim[53] = 8'hb2;
    stim[54] = 8'hfe;
    stim[55] = 8'h5f;
    stim[56] = 8'he2;
    stim[57] = 8'haf;
    stim[58] = 8'haf;
    stim[59] = 8'hc0;
    stim[60] = 8'h9e;
    stim[61] = 8'hab;
    stim[62] = 8'he7;
    stim[63] = 8'ha2;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 10'h0a8;
      expv[1] = 10'h005;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h005;
      expv[5] = 10'h000;
      expv[6] = 10'h090;
      expv[7] = 10'h0ca;
      expv[8] = 10'h090;
      expv[9] = 10'h005;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h005;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h090;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h18a;
      expv[21] = 10'h005;
      expv[22] = 10'h0a8;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h005;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h14a;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h090;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h090;
      expv[45] = 10'h000;
      expv[46] = 10'h005;
      expv[47] = 10'h000;
      expv[48] = 10'h08a;
      expv[49] = 10'h0a8;
      expv[50] = 10'h090;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h005;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h005;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h005;
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
