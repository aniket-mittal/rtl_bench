// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 80;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01702 dut (
    .addr(in_vec[31:0]),
    .str(out_vec[79:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h2d4e09e3;
    stim[1] = 32'h94c75c28;
    stim[2] = 32'h5233d424;
    stim[3] = 32'hafa5af4e;
    stim[4] = 32'hb6e88d98;
    stim[5] = 32'h3dac3445;
    stim[6] = 32'h61416ac3;
    stim[7] = 32'h5b0b9774;
    stim[8] = 32'h6386cc19;
    stim[9] = 32'h0ad46de4;
    stim[10] = 32'h84d6fb5f;
    stim[11] = 32'hc65abfac;
    stim[12] = 32'heb926671;
    stim[13] = 32'h87253e5b;
    stim[14] = 32'h8ff3a861;
    stim[15] = 32'h960aa5bb;
    stim[16] = 32'h305edb05;
    stim[17] = 32'he1a74c83;
    stim[18] = 32'hdb54fa4e;
    stim[19] = 32'h51638d90;
    stim[20] = 32'h74cf3db1;
    stim[21] = 32'hdd73d8af;
    stim[22] = 32'h4d348694;
    stim[23] = 32'hc26fc801;
    stim[24] = 32'h8be48628;
    stim[25] = 32'h06ba6956;
    stim[26] = 32'hb1394e54;
    stim[27] = 32'h6562b32e;
    stim[28] = 32'h0c6f6a0e;
    stim[29] = 32'hcd8d52e3;
    stim[30] = 32'h0438e882;
    stim[31] = 32'he3c13f66;
    stim[32] = 32'h01897bdf;
    stim[33] = 32'hb3859ffa;
    stim[34] = 32'h8e22f06d;
    stim[35] = 32'h7d0af40d;
    stim[36] = 32'h002c2b7d;
    stim[37] = 32'h08cef226;
    stim[38] = 32'h6c22ca21;
    stim[39] = 32'h5537bdfa;
    stim[40] = 32'h8f54551e;
    stim[41] = 32'hc0664623;
    stim[42] = 32'h2a16c9b7;
    stim[43] = 32'h847ae9cd;
    stim[44] = 32'h121e795d;
    stim[45] = 32'hd87cfd28;
    stim[46] = 32'h49d85f1c;
    stim[47] = 32'hef2fe56b;
    stim[48] = 32'he9b386b5;
    stim[49] = 32'h9162be20;
    stim[50] = 32'h4ece0100;
    stim[51] = 32'h008a8225;
    stim[52] = 32'h3dd96550;
    stim[53] = 32'h04bcd443;
    stim[54] = 32'ha45de398;
    stim[55] = 32'h28c09354;
    stim[56] = 32'hc7b5d793;
    stim[57] = 32'h5a0fc9c0;
    stim[58] = 32'h2e1de601;
    stim[59] = 32'h9087fca0;
    stim[60] = 32'hd501ebdf;
    stim[61] = 32'h7a4e2b6a;
    stim[62] = 32'he67330b9;
    stim[63] = 32'h8ef793c8;
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
      expv[0] = 80'h30783244344530394533;
      expv[1] = 80'h30783934433735433238;
      expv[2] = 80'h30783532333344343234;
      expv[3] = 80'h30784146413541463445;
      expv[4] = 80'h30784236453838443938;
      expv[5] = 80'h30783344414333343435;
      expv[6] = 80'h30783631343136414333;
      expv[7] = 80'h30783542304239373734;
      expv[8] = 80'h30783633383643433139;
      expv[9] = 80'h30783041443436444534;
      expv[10] = 80'h30783834443646423546;
      expv[11] = 80'h30784336354142464143;
      expv[12] = 80'h30784542393236363731;
      expv[13] = 80'h30783837323533453542;
      expv[14] = 80'h30783846463341383631;
      expv[15] = 80'h30783936304141354242;
      expv[16] = 80'h30783330354544423035;
      expv[17] = 80'h30784531413734433833;
      expv[18] = 80'h30784442353446413445;
      expv[19] = 80'h30783531363338443930;
      expv[20] = 80'h30783734434633444231;
      expv[21] = 80'h30784444373344384146;
      expv[22] = 80'h30783444333438363934;
      expv[23] = 80'h30784332364643383031;
      expv[24] = 80'h30783842453438363238;
      expv[25] = 80'h30783036424136393536;
      expv[26] = 80'h30784231333934453534;
      expv[27] = 80'h30783635363242333245;
      expv[28] = 80'h30783043364636413045;
      expv[29] = 80'h30784344384435324533;
      expv[30] = 80'h30783034333845383832;
      expv[31] = 80'h30784533433133463636;
      expv[32] = 80'h30783031383937424446;
      expv[33] = 80'h30784233383539464641;
      expv[34] = 80'h30783845323246303644;
      expv[35] = 80'h30783744304146343044;
      expv[36] = 80'h30783030324332423744;
      expv[37] = 80'h30783038434546323236;
      expv[38] = 80'h30783643323243413231;
      expv[39] = 80'h30783535333742444641;
      expv[40] = 80'h30783846353435353145;
      expv[41] = 80'h30784330363634363233;
      expv[42] = 80'h30783241313643394237;
      expv[43] = 80'h30783834374145394344;
      expv[44] = 80'h30783132314537393544;
      expv[45] = 80'h30784438374346443238;
      expv[46] = 80'h30783439443835463143;
      expv[47] = 80'h30784546324645353642;
      expv[48] = 80'h30784539423338364235;
      expv[49] = 80'h30783931363242453230;
      expv[50] = 80'h30783445434530313030;
      expv[51] = 80'h30783030384138323235;
      expv[52] = 80'h30783344443936353530;
      expv[53] = 80'h30783034424344343433;
      expv[54] = 80'h30784134354445333938;
      expv[55] = 80'h30783238433039333534;
      expv[56] = 80'h30784337423544373933;
      expv[57] = 80'h30783541304643394330;
      expv[58] = 80'h30783245314445363031;
      expv[59] = 80'h30783930383746434130;
      expv[60] = 80'h30784435303145424446;
      expv[61] = 80'h30783741344532423641;
      expv[62] = 80'h30784536373333304239;
      expv[63] = 80'h30783845463739334338;
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
