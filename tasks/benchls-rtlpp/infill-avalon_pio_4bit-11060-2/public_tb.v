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

  rtlpp_11060 dut (
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
    stim[0] = 41'h0f52548ccc7;
    stim[1] = 41'h10cdbf54a2d;
    stim[2] = 41'h01bbfd7e854;
    stim[3] = 41'h1b632421dc3;
    stim[4] = 41'h1779ef22ff0;
    stim[5] = 41'h1366cb80821;
    stim[6] = 41'h0fa3ffb64ad;
    stim[7] = 41'h16a054993f2;
    stim[8] = 41'h1683d8680d2;
    stim[9] = 41'h0867da8c61d;
    stim[10] = 41'h0d2ac123ebd;
    stim[11] = 41'h03ba77b9834;
    stim[12] = 41'h057ba14a6cf;
    stim[13] = 41'h04f4d798a19;
    stim[14] = 41'h136ddb228f7;
    stim[15] = 41'h1e6fa0f376c;
    stim[16] = 41'h1feb7f4e671;
    stim[17] = 41'h0c1cb137e2c;
    stim[18] = 41'h183ecc72e04;
    stim[19] = 41'h19bcc7b7cb4;
    stim[20] = 41'h1f2d19f1630;
    stim[21] = 41'h09a1a8076d4;
    stim[22] = 41'h13bbd37f4f2;
    stim[23] = 41'h14e10f9e864;
    stim[24] = 41'h1766a85eee5;
    stim[25] = 41'h1c621c3a961;
    stim[26] = 41'h086744634e4;
    stim[27] = 41'h09f142bc5c0;
    stim[28] = 41'h176170be1df;
    stim[29] = 41'h127bab93edb;
    stim[30] = 41'h1fec45ff521;
    stim[31] = 41'h10bbae993e2;
    stim[32] = 41'h0ea5b818c65;
    stim[33] = 41'h036664aa175;
    stim[34] = 41'h106751e2237;
    stim[35] = 41'h002bdea07ba;
    stim[36] = 41'h0928974af5d;
    stim[37] = 41'h11e7c1a9c7f;
    stim[38] = 41'h1fff2dd8536;
    stim[39] = 41'h132077bdd00;
    stim[40] = 41'h1ba40e22505;
    stim[41] = 41'h0df3b4d3ee3;
    stim[42] = 41'h023348bac32;
    stim[43] = 41'h1ffca4e2743;
    stim[44] = 41'h136d403c503;
    stim[45] = 41'h18f1c7ef047;
    stim[46] = 41'h02f054598a6;
    stim[47] = 41'h1ffde129a3a;
    stim[48] = 41'h14e62ed55ec;
    stim[49] = 41'h18f51f756d8;
    stim[50] = 41'h003d58d7f4e;
    stim[51] = 41'h13e18ddc394;
    stim[52] = 41'h013f92b3565;
    stim[53] = 41'h0b72a656b25;
    stim[54] = 41'h0f65464edb5;
    stim[55] = 41'h17a5ddc85a1;
    stim[56] = 41'h08a3bbea834;
    stim[57] = 41'h04e1cc30c85;
    stim[58] = 41'h1f386d89efe;
    stim[59] = 41'h093708dc061;
    stim[60] = 41'h0c6eef59707;
    stim[61] = 41'h11f62eb6f9e;
    stim[62] = 41'h18b233e6e20;
    stim[63] = 41'h0d65942f759;
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
      expv[3] = 33'h000000006;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h00000000e;
      expv[13] = 33'h000000005;
      expv[14] = 33'h000000003;
      expv[15] = 33'h000000000;
      expv[16] = 33'h00000000f;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h100000004;
      expv[26] = 33'h00000000e;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000000;
      expv[29] = 33'h100000005;
      expv[30] = 33'h10000000f;
      expv[31] = 33'h00000000e;
      expv[32] = 33'h00000000f;
      expv[33] = 33'h100000000;
      expv[34] = 33'h10000000d;
      expv[35] = 33'h10000000f;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000000;
      expv[38] = 33'h10000000f;
      expv[39] = 33'h10000000f;
      expv[40] = 33'h10000000f;
      expv[41] = 33'h10000000f;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000008;
      expv[44] = 33'h10000000f;
      expv[45] = 33'h10000000f;
      expv[46] = 33'h10000000f;
      expv[47] = 33'h10000000b;
      expv[48] = 33'h10000000f;
      expv[49] = 33'h10000000f;
      expv[50] = 33'h10000000f;
      expv[51] = 33'h100000000;
      expv[52] = 33'h10000000c;
      expv[53] = 33'h100000004;
      expv[54] = 33'h100000000;
      expv[55] = 33'h100000000;
      expv[56] = 33'h10000000c;
      expv[57] = 33'h100000000;
      expv[58] = 33'h100000003;
      expv[59] = 33'h10000000f;
      expv[60] = 33'h100000000;
      expv[61] = 33'h100000000;
      expv[62] = 33'h100000001;
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
