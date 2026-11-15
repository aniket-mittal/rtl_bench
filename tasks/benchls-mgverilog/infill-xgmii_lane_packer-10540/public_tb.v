// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10540 dut (
    .input_xgmii_d(in_vec[71:8]),
    .input_xgmii_c(in_vec[7:0]),
    .output_xgmii_dc(out_vec[72:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'he4cf756155c5da9ca6;
    stim[1] = 72'hffa3dc325fc1acf459;
    stim[2] = 72'h8eda20192f9e14fd08;
    stim[3] = 72'hc2d5633bbacc35875b;
    stim[4] = 72'hb5a02e7c6c6fd24b8b;
    stim[5] = 72'h616d16b34ec9aac581;
    stim[6] = 72'h859f66128a34dd565c;
    stim[7] = 72'hcb2432aeab98d942eb;
    stim[8] = 72'h71bc149198f2d1d715;
    stim[9] = 72'h906739a9d740d21963;
    stim[10] = 72'hf99a1e307fab6156e0;
    stim[11] = 72'h98e5d2df7c3bc606f4;
    stim[12] = 72'h9a4971660d2e38bc77;
    stim[13] = 72'hd7862b1ed228f9228f;
    stim[14] = 72'h94694285c274dfd7d1;
    stim[15] = 72'h8ece1e89d0877ec25b;
    stim[16] = 72'h109969d6773ea7a9e2;
    stim[17] = 72'h91590617f234fbbfb3;
    stim[18] = 72'h2b852f81714f8e2bfc;
    stim[19] = 72'h11ef10ef9d6aeae42c;
    stim[20] = 72'h78e7dd5f03bbca4011;
    stim[21] = 72'hcabea28c537be36ff1;
    stim[22] = 72'h247c5c62774a44d5b2;
    stim[23] = 72'hf0b1d9860271993700;
    stim[24] = 72'he307d1c5da116b1e49;
    stim[25] = 72'h40c00ab8e9cca902e6;
    stim[26] = 72'h1d8c73c84bf33708b8;
    stim[27] = 72'h227b700dab2b9c8c9a;
    stim[28] = 72'he7c42c852938b22e11;
    stim[29] = 72'h72e6937b70e014f204;
    stim[30] = 72'hc0fa8679661e67b845;
    stim[31] = 72'hd7282eeb36705b4548;
    stim[32] = 72'hfa5260318e81e5d4ea;
    stim[33] = 72'h857f89e82d938eb7b0;
    stim[34] = 72'h1bd563a14f74bcf505;
    stim[35] = 72'h20513406e9a28a5196;
    stim[36] = 72'hcb8ff1276de1b2d769;
    stim[37] = 72'ha51548559949730855;
    stim[38] = 72'he6b7b6a20396fc2a2e;
    stim[39] = 72'h5fc996623758d7bfc2;
    stim[40] = 72'h41b0ae08dace17dd45;
    stim[41] = 72'h459e33391e49329bbc;
    stim[42] = 72'hef7378eacc16a7fe42;
    stim[43] = 72'hd588436d8a762ac21f;
    stim[44] = 72'hef1273488291671222;
    stim[45] = 72'had3b33745979730652;
    stim[46] = 72'h7d6004ab001f386733;
    stim[47] = 72'h304d1032c8a9f50903;
    stim[48] = 72'h934737f29bc7a007b8;
    stim[49] = 72'h52634f3b637e0610bb;
    stim[50] = 72'h9564681a5876f14be6;
    stim[51] = 72'h2e73bb469cb4241558;
    stim[52] = 72'hd9bce8700ec6308cb9;
    stim[53] = 72'h07c59a9a39052b8105;
    stim[54] = 72'hf8a3196eb055bb549e;
    stim[55] = 72'h73d2de8ceb51af66b1;
    stim[56] = 72'hc3122e00ff9d41aa47;
    stim[57] = 72'h6b967393e7a108846a;
    stim[58] = 72'h07a7da943a21ec7842;
    stim[59] = 72'h4ca6098ff5785c625f;
    stim[60] = 72'h7230ad874bf7898502;
    stim[61] = 72'h90dc3f45206dea3551;
    stim[62] = 72'h6d62eedbbfc64279c5;
    stim[63] = 72'h8e7ff567b383ee79c6;
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
      expv[0] = 73'hxf233eea612af17b49c;
      expv[1] = 73'hx7fe8db932afb0559f4;
      expv[2] = 73'hx47368401997a7828fd;
      expv[3] = 73'hx61754c73bdd3326b87;
      expv[4] = 73'hxdaa805c7cb61bfa54b;
      expv[5] = 73'hxb09b42cb32732555c5;
      expv[6] = 73'hx42e7ccd12c54d1ba56;
      expv[7] = 73'hxe5c9264aed5a63b342;
      expv[8] = 73'hx38af029914c7c9a3d7;
      expv[9] = 73'hx4859e72a96b903a519;
      expv[10] = 73'hxfce6a3c303faacc256;
      expv[11] = 73'hxcc797a5df3e4ed8c06;
      expv[12] = 73'hx4d526e36606cba71bc;
      expv[13] = 73'hxeba18561ee94a3f322;
      expv[14] = 73'hxca5a48585611d1bfd7;
      expv[15] = 73'hx477383d89e821efdc2;
      expv[16] = 73'hx88666d2d63b8fb4ea9;
      expv[17] = 73'hxc89660d17790d3f7bf;
      expv[18] = 73'hx95e165f81b8d3d1c2b;
      expv[19] = 73'hx08bbe20efceda9d4e4;
      expv[20] = 73'hx3c39dbb5f01aed9540;
      expv[21] = 73'hxe56fb458c299edc76f;
      expv[22] = 73'hx921f2b9623b92a88d5;
      expv[23] = 73'hx782c5b286011c53237;
      expv[24] = 73'hx71c1da2c5ed044d71e;
      expv[25] = 73'hxa070214b874f335202;
      expv[26] = 73'hx8ea32e7c8a5bcc6e08;
      expv[27] = 73'hx911ece10dd58af388c;
      expv[28] = 73'hx73b105985148e1652e;
      expv[29] = 73'hx39399267b3878028f2;
      expv[30] = 73'hx607e90c7933478cfb8;
      expv[31] = 73'hx6bca05ceb9b1c0b645;
      expv[32] = 73'hxfd54ac031c7207cad4;
      expv[33] = 73'hxc29ff13e816a4d1cb7;
      expv[34] = 73'hx0db54c6a127dd179f5;
      expv[35] = 73'hx90144690674e8b1451;
      expv[36] = 73'hx65e3fe227b6b8565d7;
      expv[37] = 73'hx52c5491554cd24e708;
      expv[38] = 73'hx732df6ca281e5bf82a;
      expv[39] = 73'hxaff252c621b963aebf;
      expv[40] = 73'hx20ec15c086d7382fdd;
      expv[41] = 73'hxa2a7a67398f524649b;
      expv[42] = 73'hx77dccf0ea6605b4efe;
      expv[43] = 73'hx6aa20876dc55da55c2;
      expv[44] = 73'hx7784ae64841246ce12;
      expv[45] = 73'hx56cec67742c9e6e606;
      expv[46] = 73'hx3e98209ab0007e7167;
      expv[47] = 73'hx181342032642a7eb09;
      expv[48] = 73'hxc991e6ff2cdb1d4007;
      expv[49] = 73'hxa918e9f3bb19fa0d10;
      expv[50] = 73'hxcad92d01a2c5dbe24b;
      expv[51] = 73'hx175cd7746ce2d04815;
      expv[52] = 73'hxecaf3d17087318618c;
      expv[53] = 73'hx03b15349a1cc145781;
      expv[54] = 73'hxfc28c336ed85577654;
      expv[55] = 73'hxb9b4bbd8c759455f66;
      expv[56] = 73'hx61c485c007fe7683aa;
      expv[57] = 73'hx35e5ae693f3a861084;
      expv[58] = 73'hx03e9db4941d087d878;
      expv[59] = 73'hx26698138ffade2b962;
      expv[60] = 73'hx390c15a8725bdf1285;
      expv[61] = 73'hx487707f45101b5d535;
      expv[62] = 73'hxb6d89dcdb5ff188579;
      expv[63] = 73'hxc75fdea6759e0fdc79;
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
