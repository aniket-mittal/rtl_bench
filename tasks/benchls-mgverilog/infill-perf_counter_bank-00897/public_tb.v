// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00897 dut (
    .clk(clk),
    .rst(in_vec[107:107]),
    .ie(in_vec[106:106]),
    .de(in_vec[105:105]),
    .iaddr(in_vec[104:73]),
    .daddr(in_vec[72:41]),
    .drw(in_vec[40:39]),
    .din(in_vec[38:7]),
    .pmc_int(in_vec[6:6]),
    .pmc_cache_miss_I(in_vec[5:5]),
    .pmc_cache_miss_D(in_vec[4:4]),
    .pmc_cache_access_I(in_vec[3:3]),
    .pmc_cache_access_D(in_vec[2:2]),
    .pmc_uart_recv(in_vec[1:1]),
    .pmc_uart_send(in_vec[0:0]),
    .iout(out_vec[63:32]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'he499fb9ee6e8dbcc5b24b5d4a89;
    stim[1] = 108'he22c12b7f1b569f59940c7dac2a;
    stim[2] = 108'h63e660bb97ec41436db491ae7a7;
    stim[3] = 108'h1d4de7d1a526b4068f031d09c29;
    stim[4] = 108'h27f8a4f92f97348fa710675c3b9;
    stim[5] = 108'h731350ccb65e1b5dbad357dac11;
    stim[6] = 108'h74b107a20840edde96fefe4a710;
    stim[7] = 108'h48735db7bd465bea01bea57515e;
    stim[8] = 108'h67b005e6eb6d737b079202a8a54;
    stim[9] = 108'h2978d71921c2f1e238c06db9a3f;
    stim[10] = 108'h7c9af34a59cfcd3a9be3e484f53;
    stim[11] = 108'h663061f0e5cef9c151505622035;
    stim[12] = 108'h78a0dba35c90a7290d895c08bcc;
    stim[13] = 108'h20f9c541ed5dfaf95aae83a364b;
    stim[14] = 108'h1c373b69ef091f695123c830a06;
    stim[15] = 108'h49d65a28a9706ed1d00b43980ab;
    stim[16] = 108'h318c01f045b63e68760905ccfa3;
    stim[17] = 108'h3747f3d26c587d148225aceb15c;
    stim[18] = 108'h2ae8aff93e6610ce82c290ae35b;
    stim[19] = 108'h7095ebb3a789ee52396692a61ce;
    stim[20] = 108'h25e17aa0ad4fd6c77b8cb333023;
    stim[21] = 108'h41c39c27c8f0829585eb1265baf;
    stim[22] = 108'h4ded329c98c1038a5e28f92a3e7;
    stim[23] = 108'h19c8e5c702f05c39e59faf321b5;
    stim[24] = 108'h371868d33822d0d666c48a72bd7;
    stim[25] = 108'h0ba7e689bb069c248a5fee70d6d;
    stim[26] = 108'h1c438926b67805b1b4f1d560920;
    stim[27] = 108'h5fcf18180eedd27b1a7cb55527e;
    stim[28] = 108'h07a4e6a15600efea5a7da00dc08;
    stim[29] = 108'h35cb61978053cdda6daae5911b0;
    stim[30] = 108'h21fd15624a5493070ce5493a676;
    stim[31] = 108'h2e0569d520c4d14cec5d8966f00;
    stim[32] = 108'h5b433b23f505d55af14516f0a74;
    stim[33] = 108'h519921fd5ee7064c0afec4dacd2;
    stim[34] = 108'ha166c98c8838635cb7c565ecd2a;
    stim[35] = 108'h6c343ed615123b6f8a9969376c9;
    stim[36] = 108'h0cda8d72365c9021935ac9bdf97;
    stim[37] = 108'h26da4f3b0a4750af4c55e7d6957;
    stim[38] = 108'hd7db224d61de4949755ba08e6a0;
    stim[39] = 108'h6e690822cd778012b397d02b087;
    stim[40] = 108'h714c92cb19ca262712122e6009f;
    stim[41] = 108'h35abf6924306c538e35ed368457;
    stim[42] = 108'h2d0ef508f823c6adb8b413e8205;
    stim[43] = 108'h227469d0b4c5c572eb33bc25573;
    stim[44] = 108'h4a186534923ce6ebac2be01f621;
    stim[45] = 108'h4bbe74b6ce719e749820a680ea1;
    stim[46] = 108'h76f3aef11e22368126823cc24c1;
    stim[47] = 108'h33d34e9dc4ca6a9a86f2c161421;
    stim[48] = 108'h4bad8bc9ed68d7f6c8957d4983b;
    stim[49] = 108'h52500961f24e69196d38f016600;
    stim[50] = 108'h0759372a48ca9df6eb9a12c1b6b;
    stim[51] = 108'h7426043e961aaa38b7ce759e1c6;
    stim[52] = 108'h7fc371c127affae17f6ad4dc5ff;
    stim[53] = 108'h4793a16a80b78e854e2d6be2a22;
    stim[54] = 108'h66bb4c3e6f679854be6d6852928;
    stim[55] = 108'h005d228305564ebb13346c26b8a;
    stim[56] = 108'h22750d976313c8adc751a2d9d05;
    stim[57] = 108'h29a065edf81513f03797480e7b2;
    stim[58] = 108'h53fba695c8670d38f10befa1600;
    stim[59] = 108'h61e4302ec6b2619aa5e32848fee;
    stim[60] = 108'h32c5a2c46aa03f775899b3aa95f;
    stim[61] = 108'h7b0137382642f5f4fe44232e126;
    stim[62] = 108'h141e126a011373a9aed53c8b36d;
    stim[63] = 108'h395b2149d81a335534e1fe1c6db;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
