// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063813 dut (
    .clk(clk),
    .address(in_vec[40:39]),
    .chipselect(in_vec[38:38]),
    .in_port(in_vec[37:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h1c5c7862aeb;
    stim[1] = 41'h0206300fc07;
    stim[2] = 41'h033eaa03427;
    stim[3] = 41'h0b29bf6a797;
    stim[4] = 41'h0fe3bab4e6c;
    stim[5] = 41'h0bfd824a55e;
    stim[6] = 41'h00fed51ef47;
    stim[7] = 41'h09bd7cdcd25;
    stim[8] = 41'h09ab1b9ee33;
    stim[9] = 41'h057dc021017;
    stim[10] = 41'h1ffad14f9be;
    stim[11] = 41'h04ee70d9039;
    stim[12] = 41'h003cab71133;
    stim[13] = 41'h103e10443b9;
    stim[14] = 41'h08af8e22cab;
    stim[15] = 41'h13a4c1b46d1;
    stim[16] = 41'h153c9365c58;
    stim[17] = 41'h0bf99c3946d;
    stim[18] = 41'h0b2b329d151;
    stim[19] = 41'h0ee961bc2bb;
    stim[20] = 41'h036f0c2e086;
    stim[21] = 41'h09733e8285d;
    stim[22] = 41'h1535831d045;
    stim[23] = 41'h0be1d03becc;
    stim[24] = 41'h03f6dd60382;
    stim[25] = 41'h063a486e257;
    stim[26] = 41'h0e6626ffcd8;
    stim[27] = 41'h1b76b37c8b8;
    stim[28] = 41'h1a3b133bd78;
    stim[29] = 41'h0f28ef8825a;
    stim[30] = 41'h1fa2407d27e;
    stim[31] = 41'h093c74cf703;
    stim[32] = 41'h087ae05ff45;
    stim[33] = 41'h03b301f2062;
    stim[34] = 41'h1fbd94b402c;
    stim[35] = 41'h05e0204efb4;
    stim[36] = 41'h0ca1f9d2ada;
    stim[37] = 41'h062d246ae3f;
    stim[38] = 41'h0b3043e3189;
    stim[39] = 41'h0f6a254de43;
    stim[40] = 41'h1b38b1d310c;
    stim[41] = 41'h04a2f9535e2;
    stim[42] = 41'h05663bf554f;
    stim[43] = 41'h05a1631cbe5;
    stim[44] = 41'h0d2f6446aa3;
    stim[45] = 41'h04ad6668b29;
    stim[46] = 41'h0c75240785f;
    stim[47] = 41'h0278bc8f3b9;
    stim[48] = 41'h127564cd50d;
    stim[49] = 41'h0d206fe914c;
    stim[50] = 41'h1231983c281;
    stim[51] = 41'h192655461ae;
    stim[52] = 41'h09e88db0796;
    stim[53] = 41'h1cb847d160b;
    stim[54] = 41'h153973506e1;
    stim[55] = 41'h14a467fe4a2;
    stim[56] = 41'h1aa4e8f3067;
    stim[57] = 41'h0879d451902;
    stim[58] = 41'h17b06f9023a;
    stim[59] = 41'h13a830679db;
    stim[60] = 41'h1ba18bf50b2;
    stim[61] = 41'h1d31cbcf20a;
    stim[62] = 41'h19fe1e5367f;
    stim[63] = 41'h012292df351;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h00000000c;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000003;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000005;
      expv[11] = 33'h00000000f;
      expv[12] = 33'h000000003;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h00000000d;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h00000000f;
      expv[26] = 33'h000000008;
      expv[27] = 33'h000000000;
      expv[28] = 33'h00000000f;
      expv[29] = 33'h00000000f;
      expv[30] = 33'h000000000;
      expv[31] = 33'h00000000f;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h00000000e;
      expv[35] = 33'h00000000f;
      expv[36] = 33'h000000007;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000008;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h00000000f;
      expv[42] = 33'h000000002;
      expv[43] = 33'h000000005;
      expv[44] = 33'h000000006;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000002;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000009;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h00000000f;
      expv[53] = 33'h000000000;
      expv[54] = 33'h00000000f;
      expv[55] = 33'h000000000;
      expv[56] = 33'h100000000;
      expv[57] = 33'h10000000f;
      expv[58] = 33'h100000000;
      expv[59] = 33'h100000002;
      expv[60] = 33'h100000002;
      expv[61] = 33'h10000000f;
      expv[62] = 33'h10000000f;
      expv[63] = 33'h10000000f;
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
